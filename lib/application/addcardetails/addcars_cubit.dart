import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';
import 'package:roadster_admin/domain/models/car_management_crud/get_all_car.dart';
import 'package:roadster_admin/main.dart';

part 'addcars_state.dart';

class AddcarsCubit extends Cubit<AddcarsState> {
  AddcarsCubit() : super(AddcarsInitial());
  prosessCarDetails(
      {required String brand,
      required String longitue,
      required String latitue,
      required String model,
      required String fuelType,
      required String regNo,
      required int price,
      required int seat,
      required String location,
      required int milage,
      required String registerDate,
      required String descreiption,
      required File url,
      required String imageName,
      required String longdescription}) async {
    emit(AddcarsInitial());
    final ref =
        FirebaseStorage.instance.ref().child("Car image").child(imageName);
    await ref.putFile(url);
    try {
      final urlLink = await ref.getDownloadURL();
      final FormData jsonSample = FormData.fromMap({
        "brand": brand,
        "model": model,
        "fueltype": fuelType,
        "RegNo": regNo,
        "price": price,
        "seats": seat,
        "location": location,
        "mileage": milage,
        "register": registerDate,
        "description": descreiption,
        "url": urlLink,
        "imgUrl": urlLink,
        "imgName": imageName,
        "Longdescription": longdescription,
        "latitude": latitue,
        "longitude": longitue
      });

      try {
        await dio.post(values.addCar, data: jsonSample);

        emit(AddcarsProssed());
      } on DioError {
        emit(AddcarsFailed());
      }
    } catch (e) {
      emit(AddcarsFailed());
    }
  }

  prosessCarDetailsUpdate(
      {required String brand,
      required DataList list,
      required String longitue,
      required String latitue,
      required String model,
      required String fuelType,
      required String regNo,
      required int price,
      required int seat,
      required String location,
      required int milage,
      required String registerDate,
      required String descreiption,
      required File? url,
      required String imageName,
      required String longdescription,
      required String id}) async {
    emit(AddcarsInitial());
    String? urlLink;

    try {
      if (url != null) {
        final ref =
            FirebaseStorage.instance.ref().child("Car image").child(imageName);
        await ref.delete();
        await ref.putFile(url);
        urlLink = await ref.getDownloadURL();
      }
      print(urlLink);

      final FormData jsonSample = FormData.fromMap({
        "id": id,
        "brand": brand,
        "model": model,
        "fueltype": fuelType,
        "RegNo": regNo,
        "price": price,
        "seats": seat,
        "location": location,
        "mileage": milage,
        "register": registerDate,
        "description": descreiption,
        "url": urlLink ?? list.url,
        "imgUrl": urlLink ?? list.imgUrl,
        "imgName": imageName,
        "Longdescription": longdescription,
        "latitude": latitue,
        "longitude": longitue
      });

      try {
        await dio.patch(values.updateCar, data: jsonSample);

        emit(AddcarsProssed());
      } on DioError catch (e) {
        emit(AddcarsFailed());
        print(e.response.toString());
      }
    } catch (e) {
      emit(AddcarsFailed());
      print(e.toString());
    }
  }
}
