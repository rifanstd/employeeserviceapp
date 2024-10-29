import 'package:dartz/dartz.dart';
import 'package:employeeserviceapp/data/auth/models/signin_req_params.dart';
import 'package:employeeserviceapp/data/auth/models/signup_req_params.dart';

abstract class AuthRepository {
  Future<Either> signUp(SignUpReqParams params);
  Future<Either> signIn(SignInReqParams params);
  Future<Either> signOut();
  Future<bool> isLoggedIn();
}
