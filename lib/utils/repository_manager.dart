import 'package:bloc_structure_template/api_service/dio_client.dart';
import 'package:bloc_structure_template/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';

import 'shared_preferences.dart';

final getIt = GetIt.instance;

void setup() async {
  getIt.registerLazySingleton<SharePref>(() => SharePref().init());

  getIt.registerLazySingleton<DioClient>(() => DioClient().init());

  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
}
