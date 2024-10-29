import 'package:dartz/dartz.dart';
import 'package:employeeserviceapp/data/auth/models/signin_req_params.dart';
import 'package:employeeserviceapp/data/auth/models/signup_req_params.dart';
import 'package:employeeserviceapp/data/auth/sources/auth_service.dart';
import 'package:employeeserviceapp/domain/auth/repositories/auth_repository.dart';
import 'package:employeeserviceapp/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signIn(SignInReqParams params) async {
    var data = await sl<AuthService>().signIn(params);

    return data.fold((error) {
      return Left(error);
    }, (data) async {
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('token', data['user']['token']);
      return Right(data);
    });
  }

  @override
  Future<Either> signOut() {
    throw UnimplementedError();
  }

  @override
  Future<Either> signUp(SignUpReqParams params) async {
    var data = await sl<AuthService>().signUp(params);

    return data.fold((error) {
      return Left(error);
    }, (data) async {
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('token', data['user']['token']);
      return Right(data);
    });
  }

  @override
  Future<bool> isLoggedIn() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');

    return token != null;
  }
}