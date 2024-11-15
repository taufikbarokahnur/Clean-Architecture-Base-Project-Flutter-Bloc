import 'package:base_flutter_bloc/core/utils/common/helper.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/usecase/auth/login_use_case.dart';
import '../../../../core/model/data/remote/response/auth/user_model.dart';

part 'login_event.dart';

part 'login_state.dart';

part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({
    required this.loginUseCase,
  }) : super(LoginState()) {
    on<_Login>(_onLogin);
  }

  Future<void> _onLogin(
    _Login event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await loginUseCase(event.username, event.password, 1);
    result.when(
      success: (data) {
        emit(state.copyWith(isLoading: false, userData: data));
      },
      failed: (e) {
        emit(state.copyWith(isLoading: false, userError: e));
      },
    );
  }

}
