import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  //HomeRepoImpl(
  //             ApiService(
  //                  Dio(),
  //               ),
  //             ),

  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    ApiService(
      Dio(),
    ),
  ));
}