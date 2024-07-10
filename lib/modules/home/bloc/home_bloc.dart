
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app_photos/core/models/photo_model.dart';
import 'package:test_app_photos/modules/home/repository/home_repository.dart';
import 'package:test_app_photos/network/data_state.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._homeRepository) : super(const HomeState()) {
    on<HomeGetPhotosEvent>(_mapGetAllPhotosToState);
    on<HomeUpdatePageEvent>(_mapUpdatePageToState);
  }

  /// The [HomeRepository] used by this bloc to communicate with the remote API.
  final HomeRepository _homeRepository;

  /// Maps the incoming [HomeGetPhotosEvent] to the appropriate state.
  void _mapGetAllPhotosToState(
    HomeGetPhotosEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final apiResponse = await _homeRepository.getPhotos();
      switch (apiResponse.response()) {
        case DataStateType.success:
          /// Update the state with the all photos.
          emit(state.copyWith(
            allPhotos: apiResponse.data,
            newPage: 1,
          ));
          /// Update the state with the new photos.
          emit(state.copyWith(
            status: HomeStatus.loaded,
            currentPhotos: state.newPhotos,
          ));
        case DataStateType.failed:
          /// Update the state with the failure status.
          emit(state.copyWith(status: HomeStatus.failure));
      }
    } catch (_) {
      /// Update the state with the failure status.
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  /// Maps the incoming [HomeUpdatePageEvent] to the appropriate state.
  void _mapUpdatePageToState (
    HomeUpdatePageEvent event,
    Emitter<HomeState> emit,
  ) async {
    /// Update the state with the new page.
    emit(state.copyWith(
      status: HomeStatus.loaded,
      newPage: state.newPage + 1,
      currentPhotos: state.newPhotos,
    ));
  }
}
