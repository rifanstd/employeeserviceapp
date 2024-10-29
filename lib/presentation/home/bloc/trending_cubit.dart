import 'package:employeeserviceapp/domain/movie/usecases/get_popular_tv_usecase.dart';
import 'package:employeeserviceapp/domain/movie/usecases/get_trending_movies_usecase.dart';
import 'package:employeeserviceapp/domain/movie/usecases/get_trending_tv_usecase.dart';
import 'package:employeeserviceapp/presentation/home/bloc/trending_state.dart';
import 'package:employeeserviceapp/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingMoviesLoading());

  void getTrendingMovies() async {
    var returnedData = await sl<GetTrendingMoviesUseCase>().call();
    returnedData.fold(
      (error) {
        emit(TrendingMoviesFailedLoad(error: error));
      },
      (data) {
        emit(TrendingMoviesLoaded(movies: data));
      },
    );
  }

  void getTrendingTV() async {
    var returnedData = await sl<GetTrendingTVUseCase>().call();
    returnedData.fold(
      (error) {
        emit(TrendingMoviesFailedLoad(error: error));
      },
      (data) {
        emit(TrendingMoviesLoaded(movies: data));
      },
    );
  }

  void getPopularTV() async {
    var returnedData = await sl<GetPopularTVUseCase>().call();
    returnedData.fold(
      (error) {
        emit(TrendingMoviesFailedLoad(error: error));
      },
      (data) {
        emit(TrendingMoviesLoaded(movies: data));
      },
    );
  }
}
