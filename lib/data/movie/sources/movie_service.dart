import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employeeserviceapp/core/constants/api_url.dart';
import 'package:employeeserviceapp/core/network/dio_client.dart';
import 'package:employeeserviceapp/service_locator.dart';

abstract class MovieService {
  Future<Either> getTrendingMovies();
  Future<Either> getTrendingTV();
  Future<Either> getPopularTV();
}

class MovieServiceImpl extends MovieService {
  @override
  Future<Either> getTrendingMovies() async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.trendingMovies,
        options: Options(
          headers: {'Content-Type': 'application/json', 'Authorization': ApiUrl.bearerToken},
        ),
      );

      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getTrendingTV() async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.trendingTV,
        options: Options(
          headers: {'Content-Type': 'application/json', 'Authorization': ApiUrl.bearerToken},
        ),
      );

      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getPopularTV() async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.popularTV,
        options: Options(
          headers: {'Content-Type': 'application/json', 'Authorization': ApiUrl.bearerToken},
        ),
      );

      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}