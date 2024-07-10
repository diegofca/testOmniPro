
import 'package:test_app_photos/core/models/photo_model.dart';
import 'package:test_app_photos/network/data_state.dart';

abstract class HomeRepository {
  /// Returns a [Future] that completes with a [DataState] containing a [List<Photo>]
   Future<DataState<List<Photo>>> getPhotos();
}