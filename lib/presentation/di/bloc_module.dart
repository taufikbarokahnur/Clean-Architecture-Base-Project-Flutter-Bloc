import 'package:base_flutter_bloc/presentation/screens/home/bloc/home_bloc.dart';
import 'package:base_flutter_bloc/presentation/screens/login/bloc/login_bloc.dart';

import '../../core/utils/di/injector.dart';

Future<void> initializeBlocDependencies() async {
  /*
  *  Separate Bloc for each screen if needed
  */

  injector.registerFactory<LoginBloc>(
    () => LoginBloc(
      loginUseCase: injector(),
    ),
  );

  injector.registerFactory(
    () => HomeBloc(
      getUserUseCase: injector(),
    ),
  );
}
