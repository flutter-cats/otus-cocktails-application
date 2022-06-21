package com.example.numismatist

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity() {
      private val CHANNEL = "numismatist/version"

      override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
            super.configureFlutterEngine(flutterEngine)
            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {                  
                  call, result ->
                  if (call.method == "getApplicationVersion") {
                    val version = getVersion()
                    result.success(version)                    
                  } else {
                    result.notImplemented()
                  }
                }
          }
      
          private fun getVersion(): String = "v.${BuildConfig.VERSION_NAME}/${BuildConfig.VERSION_CODE}"            
}
