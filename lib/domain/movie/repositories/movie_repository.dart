import 'package:dartz/dartz.dart';
import 'package:employeeserviceapp/data/movie/models/recommendation_req_params.dart';

abstract class MovieRepository {
  Future<Either> getTrendingMovies();
  Future<Either> getTrendingTV();
  Future<Either> getPopularTV();
  Future<Either> getRecommendationsMovie(RecommendationReqParams params);
}
