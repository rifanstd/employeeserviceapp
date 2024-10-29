import 'package:dartz/dartz.dart';
import 'package:employeeserviceapp/core/usecase/usecase.dart';
import 'package:employeeserviceapp/data/auth/models/signin_req_params.dart';
import 'package:employeeserviceapp/domain/auth/repositories/auth.dart';
import 'package:employeeserviceapp/service_locator.dart';

class SignInUseCase extends UseCase<Either, SignInReqParams> {
  @override
  Future<Either> call({SignInReqParams? params}) async {
    return await sl<AuthRepository>().signIn(params!);
  }
}
