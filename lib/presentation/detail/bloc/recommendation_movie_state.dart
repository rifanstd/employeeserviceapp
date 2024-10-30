import 'package:employeeserviceapp/domain/movie/entities/movie_entity.dart';

abstract class RecommendationsMovieState {}

class RecommendationsMovieLoading extends RecommendationsMovieState {}

class RecommendationsMovieLoaded extends RecommendationsMovieState {
  final List<MovieEntity> movies;
  RecommendationsMovieLoaded({required this.movies});
}

class RecommendationsMovieFailed extends RecommendationsMovieState {
  final String error;
  RecommendationsMovieFailed({required this.error});
}
