import 'package:test_app_photos/modules/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_app_photos/modules/home/repository/home_repository.dart';
import 'package:test_app_photos/modules/home/repository/home_repository_imp.dart';
import 'package:test_app_photos/utils/locator.dart';

/// Provides instances of [HomeBlocProvider] using dependency injection.
class HomeBlocProvider {
  /// Returns an instance of [HomeBloc] with required dependencies.
  static HomeBloc get(BuildContext context) {
    // Get instances of required use cases and validators from the dependency locator.
    final HomeRepository homeRepository = locator<HomeRepositoryImpl>();
    // Create and return an instance of [HomeBloc] with the retrieved dependencies.
    return HomeBloc(homeRepository);
  }
}
