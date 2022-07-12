import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:roadster_admin/domain/api/api_values.dart';

import '../../domain/models/login_response.dart';

part 'logindetails_state.dart';

class LogindetailsCubit extends Cubit<LogindetailsState> {
  LogindetailsCubit() : super(LoginDetailsCheck());

  loginchecking(String email, String password) async {
    emit(LoginlodingState());

    ApiValues values = ApiValues();
    final data = {"email": email, "password": password};
    Response response;
    Dio dio = Dio(
        BaseOptions(responseType: ResponseType.plain, baseUrl: values.baseUrl));
    const FlutterSecureStorage storage = FlutterSecureStorage();

    try {
      response = await dio.post(values.adminLogin, data: jsonEncode(data));

      if (response.statusCode == 200) {
        storage.write(key: "valueObject", value: response.data);

        emit(LoginSucessState());
      } else {
        throw DioError;
      }
    } catch (e) {
      if (e is DioError) {
        if (e.type == DioErrorType.response) {
          emit(LoginFailedState());
        } else {
          emit(NetworkErroLogin());
        }
      } else {}
    }
  }
}
