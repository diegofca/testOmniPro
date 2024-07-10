

// Code generation using retrofit for the HomeApiService.
import 'dart:io';

import 'package:test_app_photos/core/constants/api_constants.dart';
import 'package:test_app_photos/core/models/photo_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';

/// REST API service for handling photos.
abstract class HomeApiService {
  /// Endpoint to retrieve photos.
  Future<HttpResponse<List<Photo>>> getPhotos();
}

class HomeApiServiceImpl implements HomeApiService {

  final http.Client _client;

  HomeApiServiceImpl(this._client);

  @override
  Future<HttpResponse<List<Photo>>> getPhotos() async {
   final url = Uri.parse(ApiConstants.photos);

    final response = await _client.get(url);

    if (response.statusCode == HttpStatus.ok) {
      final data = jsonDecode(response.body);
      final model = PhotoResponse.fromJson(data);
      return HttpResponse(model.photos, response);
    } else {
      throw Exception('Failed to load photos');
    } 
  }
}

class HttpResponse<T> {
  final T data;
  final Response response;

  HttpResponse(this.data, this.response);
}