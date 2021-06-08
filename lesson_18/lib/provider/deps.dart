import 'package:lesson_18/di/di.dart';

class FirstClass {
  FirstClass({
    required this.secondClass,
  });

  final SecondClass secondClass;
}

class SecondClass {
  SecondClass({
    required this.thirdClass,
  });

  final ThirdClass thirdClass;
}

class ThirdClass {}

class HeadOnDeps {
  final ThirdClass thirdClass = ThirdClass();
  final FirstClass firstClass = FirstClass(secondClass: SecondClass(thirdClass: ThirdClass()));
}

final headOnClass = HeadOnDeps();

/// Somewhere in code
final ThirdClass thirdClass = ThirdClass();
final FirstClass firstClass = FirstClass(secondClass: SecondClass(thirdClass: ThirdClass()));

class ThroughDeps {
  ThroughDeps({
    required this.thirdClass,
    required this.firstClass,
  });

  final ThirdClass thirdClass;
  final FirstClass firstClass;
}

final throughClass = ThroughDeps(firstClass: firstClass, thirdClass: thirdClass);

/// Somewhere in DI layer
final registered = registerDependencies();

class WithServiceLocator {
  WithServiceLocator({
    required this.thirdClass,
    required this.firstClass,
  });

  final ThirdClass thirdClass;
  final FirstClass firstClass;
}

final withServiceLocatorClass = WithServiceLocator(thirdClass: di.get(), firstClass: di.get());
