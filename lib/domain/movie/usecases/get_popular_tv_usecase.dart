import 'package:dartz/dartz.dart';
import 'package:employeeserviceapp/core/usecase/usecase.dart';
import 'package:employeeserviceapp/domain/movie/repositories/movie_repository.dart';
import 'package:employeeserviceapp/service_locator.dart';

class GetPopularTVUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<MovieRepository>().getPopularTV();
  }
}
