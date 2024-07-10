
import 'package:get_it/get_it.dart';
import 'package:test_app_photos/modules/home/repository/useCase/home_get_photo_list_use_case.dart';
import 'package:test_app_photos/modules/home/repository/dataSource/home_api_service.dart';
import 'package:test_app_photos/modules/home/repository/home_repository_imp.dart';
import 'package:http/http.dart' as http;
import 'dart:async';


/// A singleton instance of GetIt locator for dependency injection.
final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  // Services
  _initializeServices();
  // Use cases
  _initializeUseCases();
  // Remote repositories
  _initializeRemoteRepositories();
}

void _initializeServices() {
  locator.registerSingleton<HomeApiService>(
    HomeApiServiceImpl(http.Client()),
  );
}

void _initializeRemoteRepositories() {
  locator.registerSingleton<HomeRepositoryImpl>(
    HomeRepositoryImpl(locator<HomeGetPhotosUseCase>()),
  );
}

void _initializeUseCases() {
  locator.registerLazySingleton(
    () => HomeGetPhotosUseCase(locator< HomeApiService>()),
  );
}
