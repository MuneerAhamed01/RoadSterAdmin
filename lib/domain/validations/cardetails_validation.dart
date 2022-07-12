import 'package:flutter/cupertino.dart';
import 'package:roadster_admin/domain/models/get_district_data/get_district.dart';

class ValidateCarDetails {
  static String? carValidation(String? value,
      {dynamic specialValidate, TextEditingController? controller}) {
    if (value == null || value.isEmpty) {
      return "";
    } else if (specialValidate != null && specialValidate is List<Getdatum>) {

      if (!cheackIsThereORNot(controller!.text, specialValidate)) {
        return 'We have no service in this area';
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}

bool cheackIsThereORNot(String textInController, List<Getdatum> cheakTheValue) {
  for (int i = 0; i < cheakTheValue.length; i++) {
    
    if (cheakTheValue[i].district.toLowerCase().trim() ==
        textInController.trim().toLowerCase()) {
      return true;
    } else {
      continue;
    }
  }
  return false;
}
