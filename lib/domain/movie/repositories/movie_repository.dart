import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either> getTrendingMovies();
  Future<Either> getTrendingTV();
  Future<Either> getPopularTV();
}
