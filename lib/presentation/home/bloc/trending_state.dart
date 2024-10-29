import 'package:employeeserviceapp/domain/movie/entities/movie_entity.dart';

abstract class TrendingState {}

class TrendingMoviesLoading extends TrendingState {}

class TrendingMoviesLoaded extends TrendingState {
  final List<MovieEntity> movies;
  TrendingMoviesLoaded({required this.movies});
}

class TrendingMoviesFailedLoad extends TrendingState {
  final String error;
  TrendingMoviesFailedLoad({required this.error});
}
