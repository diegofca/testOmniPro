import 'package:test_app_photos/modules/home/repository/dataSource/home_api_service.dart';
import 'package:test_app_photos/modules/home/repository/home_repository.dart';
import 'package:test_app_photos/network/base_repository.dart';
import 'package:test_app_photos/core/models/photo_model.dart';
import 'package:test_app_photos/network/data_state.dart';

/// Implementation of the [HomeRepository] interface that communicates
/// with the remote API via the [HomeApiService].
class HomeRepositoryImpl extends BaseApiRepository implements HomeRepository {
  /// Constructs a [HomeRepositoryImpl] with the provided [HomeApiService].
  HomeRepositoryImpl(this._homeApiService);

  final HomeApiService _homeApiService;

  @override
  Future<DataState<List<Photo>>> getPhotos() {
    return getStateOf(request: () => _homeApiService.getPhotos());
  }
}
    