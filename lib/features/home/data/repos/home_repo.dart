import 'package:fluttertest/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fluttertest/features/home/data/models/data_models.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<DataModels>>> fetchData();
}
