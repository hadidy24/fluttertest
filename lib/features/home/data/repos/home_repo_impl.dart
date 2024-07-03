import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/core/errors/failures.dart';
import 'package:fluttertest/core/utils/app_services.dart';
import 'package:fluttertest/features/home/data/models/data_models.dart';
import 'package:fluttertest/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<DataModels>>> fetchData() async {
    try {
      var data = await apiService.get(endPoint: "/posts");
      List<DataModels> datas = [];
      for (var item in data['items']) {
        debugPrint("fetching items $item");
        datas.add(DataModels.fromJson(item));
      }
      return right(datas);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
