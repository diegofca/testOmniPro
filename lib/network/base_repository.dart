import 'dart:io';
import 'package:flutter/material.dart';
import 'package:test_app_photos/network/data_state.dart';

import '../modules/home/repository/dataSource/home_api_service.dart';

abstract class BaseApiRepository {
  /// This method is responsible of handling the given `request`, in which
  /// it returns generic based `DataState`.
  ///
  /// Returns `DataSuccess` that holds the generic data `T` if the response
  /// is successfully recieved.
  ///
  /// Returns `DataFailed` that holds a `ApiError` instance if any error occurs
  /// while sending the request or recieving the response.
  @protected
  Future<DataState<T>> getStateOf<T>({
    required Future<HttpResponse<T>> Function() request,
  }) async {
    try {
      final httpResponse = await request();
      switch (httpResponse.response.statusCode) {
        case HttpStatus.ok:
        case HttpStatus.created:
        case HttpStatus.accepted:
          return DataSuccess(httpResponse.data);
        default:
          throw ApiException(
            httpResponse.response.body,
            httpResponse.response.statusCode.toString(),
          );
      }
    } on ApiException catch (error) {
      return DataFailed(
        apiException: ApiException(
          error.message,
          error.code,
        ),
      );
    }
  }
}
