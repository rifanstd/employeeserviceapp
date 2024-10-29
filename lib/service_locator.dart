import 'package:employeeserviceapp/core/network/dio_client.dart';
import 'package:employeeserviceapp/data/auth/repositories/auth.dart';
import 'package:employeeserviceapp/data/auth/sources/auth_api_service.dart';
import 'package:employeeserviceapp/domain/auth/repositories/auth.dart';
import 'package:employeeserviceapp/domain/auth/usecases/is_logged_in.dart';
import 'package:employeeserviceapp/domain/auth/usecases/signin.dart';
import 'package:employeeserviceapp/domain/auth/usecases/signup.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // Client
  sl.registerSingleton<DioClient>(DioClient());

  // Service
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());

  // Repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // Use case
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
}
