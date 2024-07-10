part of 'home_bloc.dart';

enum HomeStatus { loaded, loading, failure }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.loading,
    this.allPhotos = const [],
    this.currentPhotos = const [],
    this.newPage = 1,
  });

  final int _paginationCounter = 10;

  final HomeStatus status;
  final List<Photo> allPhotos;
  final List<Photo> currentPhotos;
  final int newPage;

  /// Returns the new photos to be displayed on the home page.
  List<Photo> get newPhotos => allPhotos.sublist(0, newPage * _paginationCounter);

  @override
  List<Object> get props => [status, allPhotos, currentPhotos, newPage];

  /// Returns a new instance of [HomeState] with the provided fields updated.
  HomeState copyWith({
    HomeStatus? status,
    List<Photo>? allPhotos,
    List<Photo>? currentPhotos,
    int? newPage,
  }) {
    return HomeState(
      status: status ?? this.status,
      allPhotos: allPhotos ?? this.allPhotos,
      currentPhotos: currentPhotos ?? this.currentPhotos,
      newPage: newPage ?? this.newPage,
    );
  }
}
