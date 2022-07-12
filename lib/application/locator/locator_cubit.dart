import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:geocoding/geocoding.dart';

part 'locator_state.dart';

class LocatorCubit extends Cubit<LocatorState> {
  LocatorCubit() : super(LocatorInitial());
  getPosition() async {
    emit(LocatorInitial());

    Position position = await Geolocator.getCurrentPosition();
    final latitude = position.latitude;
    final longitude = position.longitude;
    final place = await placemarkFromCoordinates(latitude, longitude);

    emit(LocatorLoaded(
        latitude: latitude,
        longitude: longitude,
        place: place[0].subAdministrativeArea));
  }

  void getPositionByCoodinate(double latitude, double longitude) async {
    emit(LocatorLoaded(
        latitude: latitude, longitude: longitude, place: "Searching...."));
    try {
      final place = await placemarkFromCoordinates(latitude, longitude);

      emit(LocatorLoaded(
          latitude: latitude,
          longitude: longitude,
          place: place[0].subAdministrativeArea));
    } on PlatformException {
      emit(LocatorLoaded(latitude: latitude, longitude: longitude));
    } catch (e) {
      emit(LocatorLoaded(latitude: latitude, longitude: longitude));
    }
  }

  void editCar(double latitude, double longitude, String location) {
    emit(LocatorLoaded(
        latitude: latitude, longitude: longitude, place: location));
  }

  void fromAddressToCoodinate(String place) async {
    emit(LocatorFromCoodinateLoading(place));
    try {
      final getLocation = await locationFromAddress(place);
      final latitude = getLocation[0].latitude;
      final longitude = getLocation[0].longitude;
      emit(LocatorLoaded(
          latitude: latitude, longitude: longitude, place: place));
    } on PlatformException {
      LocatorLoaded(latitude: 0.00, longitude: 0.00, place: place);
    } catch (e) {
      LocatorLoaded(latitude: 0.00, longitude: 0.00, place: place);
    }
  }
}
