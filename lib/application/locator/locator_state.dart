part of 'locator_cubit.dart';

@immutable
abstract class LocatorState {}

class LocatorInitial extends LocatorState {}

class LocatorOnPRocess extends LocatorState {}
class LocatorFromCoodinateLoaded extends LocatorState {
    final String latitude;
  final String longitude;
  final String? place;

  LocatorFromCoodinateLoaded
  ({required this.latitude, required this.longitude, this.place});
}

class LocatorFromCoodinateLoading extends LocatorState {
  final String place;

  LocatorFromCoodinateLoading(this.place);
}


class LocatorLoaded extends LocatorState {
  final double latitude;
  final double longitude;
  final String? place;

  LocatorLoaded({required this.latitude, required this.longitude, this.place});
}
