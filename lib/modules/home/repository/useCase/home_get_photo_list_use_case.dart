
import 'package:test_app_photos/core/models/photo_model.dart';
import 'package:test_app_photos/modules/home/repository/dataSource/home_api_service.dart';
import 'package:test_app_photos/network/data_state.dart';

class HomeGetPhotosUseCase {
  final HomeApiService _homeApiService;

  /// Constructs a [HomeGetPhotosUseCase] with the provided [HomeApiService].
  HomeGetPhotosUseCase(this._homeApiService);

  /// Returns a [Future] that completes with a [DataState] containing a [List<Photo>]
  /// representing the list photos data.
  Future<HttpResponse<List<Photo>>> execute() async {
    return _homeApiService.getPhotos();
  }
}