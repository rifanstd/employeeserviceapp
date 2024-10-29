import 'package:employeeserviceapp/core/network/dio_client.dart';
import 'package:employeeserviceapp/data/auth/repositories/auth_repository_impl.dart';
import 'package:employeeserviceapp/data/auth/sources/auth_service.dart';
import 'package:employeeserviceapp/data/movie/repositories/movie_repository_impl.dart';
import 'package:employeeserviceapp/data/movie/sources/movie_service.dart';
import 'package:employeeserviceapp/domain/auth/repositories/auth_repository.dart';
import 'package:employeeserviceapp/domain/auth/usecases/is_logged_in_usecase.dart';
import 'package:employeeserviceapp/domain/auth/usecases/signin_usecase.dart';
import 'package:employeeserviceapp/domain/auth/usecases/signup_usecase.dart';
import 'package:employeeserviceapp/domain/movie/repositories/movie_repository.dart';
import 'package:employeeserviceapp/domain/movie/usecases/get_popular_tv_usecase.dart';
import 'package:employeeserviceapp/domain/movie/usecases/get_trending_movies_usecase.dart';
import 'package:employeeserviceapp/domain/movie/usecases/get_trending_tv_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // Client
  sl.registerSingleton<DioClient>(DioClient());

  // Service
  sl.registerSingleton<AuthService>(AuthServiceImpl());
  sl.registerSingleton<MovieService>(MovieServiceImpl());

  // Repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());

  // Use case
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
  sl.registerSingleton<GetTrendingTVUseCase>(GetTrendingTVUseCase());
  sl.registerSingleton<GetPopularTVUseCase>(GetPopularTVUseCase());
}
