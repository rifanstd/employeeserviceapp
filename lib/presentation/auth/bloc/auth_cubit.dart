import 'package:dartz/dartz.dart';
import 'package:employeeserviceapp/data/auth/models/signin_req_params.dart';
import 'package:employeeserviceapp/data/auth/models/signup_req_params.dart';
import 'package:employeeserviceapp/domain/auth/usecases/signin_usecase.dart';
import 'package:employeeserviceapp/domain/auth/usecases/signup_usecase.dart';
import 'package:employeeserviceapp/presentation/auth/bloc/auth_state.dart';
import 'package:employeeserviceapp/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void attemptToSignIn(SignInReqParams params) async {
    emit(SignInOnAttempt());

    Either result = await sl<SignInUseCase>().call(params: params);

    if (result is Right) {
      emit(SignInSuccess());
    } else {
      emit(SignInFailed(
        message: 'Login failed, please check your credentials',
      ));
    }
  }

  void attemptToSignUp(SignUpReqParams params) async {
    emit(SignUpOnAttempt());

    Either result = await sl<SignUpUseCase>().call(params: params);

    if (result is Right) {
      emit(SignUpSuccess());
    } else {
      emit(SignUpFailed(
        message: 'Sign Up failed, wait a minute.',
      ));
    }
  }
}
