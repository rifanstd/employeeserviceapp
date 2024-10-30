import 'package:employeeserviceapp/data/movie/models/recommendation_req_params.dart';
import 'package:employeeserviceapp/domain/movie/usecases/get_recommendations_movie.dart';
import 'package:employeeserviceapp/presentation/detail/bloc/recommendation_movie_state.dart';
import 'package:employeeserviceapp/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendationsMovieCubit extends Cubit<RecommendationsMovieState> {
  RecommendationsMovieCubit() : super(RecommendationsMovieLoading());

  void getRecommendationsMovie(int movieId, String type) async {
    var returnedData = await sl<GetRecommendationsMovieUseCase>().call(params: RecommendationReqParams(movieId: movieId, type: type));

    returnedData.fold(
      (error) => emit(RecommendationsMovieFailed(error: error)),
      (data) => emit(RecommendationsMovieLoaded(movies: data)),
    );
  }
}
