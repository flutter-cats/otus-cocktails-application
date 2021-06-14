// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import UIKit
import Flutter

class ViewController: UIViewController {
  
  @IBOutlet weak var counterLabel: UILabel!
  
  var methodChannel : FlutterMethodChannel?
  var count = 0
  weak var appDelegate = UIApplication.shared.delegate as? AppDelegate
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if appDelegate?.prewarm ?? false, let flutterEngine = appDelegate?.flutterEngine {
      setMethodChannel(flutterEngine)
    }
  }
  
  func reportCounter() {
    methodChannel?.invokeMethod("reportCounter", arguments: count)
  }
  
  @IBAction func buttonWasTapped(_ sender: Any) {
    if let flutterEngine = appDelegate?.flutterEngine {
      if !(appDelegate?.prewarm ?? false) {
        flutterEngine.run(withEntrypoint: nil)
        setMethodChannel(flutterEngine)
      }
      let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
      self.present(flutterViewController, animated: true)
    }
  }
  
  func setMethodChannel(_ flutterEngine: FlutterEngine) {
    methodChannel = FlutterMethodChannel(name: "dev.flutter.example/counter",
                                         binaryMessenger: flutterEngine.binaryMessenger)
    methodChannel?.setMethodCallHandler({ [weak self]
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      if let strongSelf = self {
        switch(call.method) {
        case "incrementCounter":
          strongSelf.count += 1
          strongSelf.counterLabel.text = "Current counter: \(strongSelf.count)"
          strongSelf.reportCounter()
        case "requestCounter":
          strongSelf.reportCounter()
        default:
          // Unrecognized method name
          print("Unrecognized method name: \(call.method)")
        }
      }
    })
  }
}
