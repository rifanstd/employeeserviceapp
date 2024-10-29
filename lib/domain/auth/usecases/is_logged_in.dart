import 'package:employeeserviceapp/core/usecase/usecase.dart';
import 'package:employeeserviceapp/domain/auth/repositories/auth.dart';
import 'package:employeeserviceapp/service_locator.dart';

class IsLoggedInUseCase extends UseCase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }
}
