
import 'package:test_app_photos/core/models/photo_model.dart';
import 'package:test_app_photos/modules/home/repository/home_repository.dart';
import 'package:test_app_photos/network/data_state.dart';

class HomeGetPhotosUseCase {
  final HomeRepository _homeRepository;

  /// Constructs a [HomeGetPhotosUseCase] with the provided [HomeRepository].
  HomeGetPhotosUseCase(this._homeRepository);

  /// Returns a [Future] that completes with a [DataState] containing a [List<Photo>]
  /// representing the list photos data.
  Future<DataState<List<Photo>>> execute() async {
    return _homeRepository.getPhotos();
  }
}