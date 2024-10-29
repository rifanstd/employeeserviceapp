import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employeeserviceapp/core/constants/api_url.dart';
import 'package:employeeserviceapp/core/network/dio_client.dart';
import 'package:employeeserviceapp/data/auth/models/signin_req_params.dart';
import 'package:employeeserviceapp/data/auth/models/signup_req_params.dart';
import 'package:employeeserviceapp/service_locator.dart';

abstract class AuthService {
  Future<Either> signUp(SignUpReqParams params);
  Future<Either> signIn(SignInReqParams params);
}

class AuthServiceImpl extends AuthService {
  @override
  Future<Either> signUp(SignUpReqParams params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.signUp,
        data: params.toJson(),
      );

      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> signIn(SignInReqParams params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.signIn,
        data: params.toJson(),
      );

      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
