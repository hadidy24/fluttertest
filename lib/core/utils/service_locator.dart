import 'package:fluttertest/core/utils/app_services.dart';
import 'package:fluttertest/features/home/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      dio: Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      apiService: getIt.get<ApiService>(),
    ),
  );
}
