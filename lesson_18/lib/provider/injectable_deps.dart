import 'package:injectable/injectable.dart';
import 'package:lesson_18/di/di.dart';
import 'package:lesson_18/provider/injectable_deps.config.dart';

@injectable
class IFirstClass {
  IFirstClass({
    required this.secondClass,
  });

  final ISecondClass secondClass;
  final String isRegistered = 'YES';
}

@injectable
class ISecondClass {
  ISecondClass(this.thirdClass);

  final IThirdClass thirdClass;
}

@injectable
class IThirdClass {}

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: false,
  asExtension: false,
)
void configureDependencies() => $initGetIt(di);
