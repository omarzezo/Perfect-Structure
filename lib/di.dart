import 'package:perfection_structure/core/base_cache/local_data.dart';
import 'package:perfection_structure/core/base_network/client/dio_client.dart';
import 'package:perfection_structure/core/base_network/network_lost/network_info.dart';
import 'features/courses_list/data/reposutory/courses_repository_imp.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/courses_list/domain/repository/courses_repo.dart';
import 'features/courses_list/domain/use_case/courses_use_case.dart';

final GetIt getIt = GetIt.instance;
class AppDependencies {


  Future<void> initialize() async {
    // Use cases
    getIt.registerLazySingleton<CoursesUseCase>(() => CoursesUseCase(getIt()));

    // Repositories
    getIt.registerLazySingleton<CoursesRepository>(
          () => CoursesRepositoryImp(
        localData: getIt(),
        networkInfo: getIt(),
        remoteData: getIt(),
      ),
    );
    // Core
    getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
    getIt.registerLazySingleton<DioClient>(() => DioClient());
    getIt.registerLazySingleton<LocalData>(() => LocalData(getIt()));

    // External
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton(() => sharedPreferences);
    getIt.registerLazySingleton(() => InternetConnectionChecker());
  }
}


