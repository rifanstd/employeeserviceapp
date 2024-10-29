import 'package:dartz/dartz.dart';
import 'package:employeeserviceapp/core/usecase/usecase.dart';
import 'package:employeeserviceapp/data/auth/models/signup_req_params.dart';
import 'package:employeeserviceapp/domain/auth/repositories/auth_repository.dart';
import 'package:employeeserviceapp/service_locator.dart';

class SignUpUseCase extends UseCase<Either, SignUpReqParams> {
  @override
  Future<Either> call({SignUpReqParams? params}) async {
    return await sl<AuthRepository>().signUp(params!);
  }
}
