import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';
import 'package:roadster_admin/main.dart';

part 'deletecar_state.dart';

class DeletecarCubit extends Cubit<DeletecarState> {
  DeletecarCubit() : super(DeletecarInitial());
  onPressed(String id, String imageName) async {
    emit(DeletecarProcess());
    final ref =
        FirebaseStorage.instance.ref().child("Car image").child(imageName);
    await ref.delete();

    Map idOf = {"deleteId": id};
    try {
      await dio.post(values.deleteCar, data: jsonEncode(idOf));

      emit(DeletecarDeleted());
    } catch (e) {
      emit(DeletecarError());
      print(e.toString());
    }
  }
}
