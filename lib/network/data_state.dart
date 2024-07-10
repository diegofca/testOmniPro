
enum DataStateType { success, failed }

abstract class DataState<T> {
  final T? data;
  final ApiException? apiException;

  const DataState({this.data, this.apiException});

  DataStateType response() =>
      data != null ? DataStateType.success : DataStateType.failed;
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed({
    ApiException? apiException
  }) : super(apiException: apiException);
}

class ApiException implements Exception {
  final String message;
  final String code;

  ApiException(this.message, this.code);
}
