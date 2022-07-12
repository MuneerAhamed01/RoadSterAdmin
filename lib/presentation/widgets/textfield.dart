import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadster_admin/domain/validations/cardetails_validation.dart';

Widget textFieldCustomized(
    {required String label,
    int? maxline,
    TextEditingController? controller,
    String? Function(String?)? validate}) {
  return TextFormField(
    maxLines: maxline,
    cursorHeight: 20.h,
    decoration: inpuDecoration(label: label),
    controller: controller,
    validator: validate,
  );
}

InputDecoration inpuDecoration({
  required String label,
}) {
  return InputDecoration(
    errorStyle: TextStyle(height: 0),
    filled: true,
    fillColor: Colors.white,
    hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
    hintText: label,
    contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
    border: const OutlineInputBorder(),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
  );
}

Widget textFieldCustomizedFroDetails(
    {required String label,
    dynamic specialValidate,
    void Function()? onTap,
    void Function(String)? onChanged,
    int? maxline,
    bool readOnly = false,
    TextInputType? type,
    FocusNode? focusNode,
    TextEditingController? controller,
    String? Function(String?)? validate}) {
  return TextFormField(
    readOnly:readOnly ,
    focusNode:focusNode ,
    onTap:onTap ,
    onFieldSubmitted: onChanged,
    keyboardType: type,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    maxLines: maxline,
    cursorHeight: 20.h,
    decoration: inpuDecoration(label: label),
    controller: controller,
    validator: (value) => ValidateCarDetails.carValidation(value,specialValidate: specialValidate,controller: controller),
  );
}
