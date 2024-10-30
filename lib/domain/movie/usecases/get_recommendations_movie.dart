import 'package:dartz/dartz.dart';
import 'package:employeeserviceapp/core/usecase/usecase.dart';
import 'package:employeeserviceapp/data/movie/models/recommendation_req_params.dart';
import 'package:employeeserviceapp/domain/movie/repositories/movie_repository.dart';
import 'package:employeeserviceapp/service_locator.dart';

class GetRecommendationsMovieUseCase extends UseCase<Either, RecommendationReqParams> {
  @override
  Future<Either> call({RecommendationReqParams? params}) async {
    return await sl<MovieRepository>().getRecommendationsMovie(params!);
  }
}
