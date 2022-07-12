import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:roadster_admin/domain/models/login_response.dart';

part 'splashscreennavigate_state.dart';

class SplashscreennavigateCubit extends Cubit<SplashscreennavigateState> {
  SplashscreennavigateCubit() : super(SplashscreennavigateInitial());

  changeScreen() async {
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();
    final storage = await secureStorage.read(key: "valueObject");

  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  // serviceEnabled = await Geolocator.isLocationServiceEnabled();
 

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {

      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
 
}

    if (storage == null || storage.isEmpty) {
      emit(SplashscreenLogin());
    } else {
      loginResponseFromJson(storage);
    
      emit(SplashscreenHome());
    }
  }
}
