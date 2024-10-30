import 'package:employeeserviceapp/core/network/dio_client.dart';
import 'package:employeeserviceapp/data/movie/repositories/movie_repository_impl.dart';
import 'package:employeeserviceapp/data/movie/sources/movie_service.dart';
import 'package:employeeserviceapp/domain/movie/repositories/movie_repository.dart';
import 'package:employeeserviceapp/domain/movie/usecases/get_popular_tv_usecase.dart';
import 'package:employeeserviceapp/domain/movie/usecases/get_recommendations_movie.dart';
import 'package:employeeserviceapp/domain/movie/usecases/get_trending_movies_usecase.dart';
import 'package:employeeserviceapp/domain/movie/usecases/get_trending_tv_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // Client
  sl.registerSingleton<DioClient>(DioClient());

  // Service
  sl.registerSingleton<MovieService>(MovieServiceImpl());

  // Repository
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());

  // Use case
  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
  sl.registerSingleton<GetTrendingTVUseCase>(GetTrendingTVUseCase());
  sl.registerSingleton<GetPopularTVUseCase>(GetPopularTVUseCase());
  sl.registerSingleton<GetRecommendationsMovieUseCase>(GetRecommendationsMovieUseCase());
}
