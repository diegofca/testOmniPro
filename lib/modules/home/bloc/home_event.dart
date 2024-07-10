
part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

// This event is used to get the photos.
class HomeGetPhotosEvent extends HomeEvent {
  const HomeGetPhotosEvent();

  @override
  List<Object?> get props => [];
}

// This event is used to update the page of the photos.
class HomeUpdatePageEvent extends HomeEvent {
  const HomeUpdatePageEvent();

  @override
  List<Object?> get props => [];
}