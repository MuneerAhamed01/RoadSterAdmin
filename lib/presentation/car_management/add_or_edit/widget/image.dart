import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadster_admin/application/adding_image/imagecontroller_cubit.dart';
import 'package:roadster_admin/domain/models/car_management_crud/get_all_car.dart';
import 'package:roadster_admin/domain/models/enums.dart';

import '../../../../domain/sizedboxes.dart';
import '../bottomsheet_image.dart';

class ImageShower extends StatelessWidget {
  const ImageShower({
    Key? key,
    required this.type,
    required this.list,
  }) : super(key: key);
  final CarAddEdit type;
  final DataList? list;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagecontrollerCubit, ImagecontrollerState>(
      builder: (context, state) {
        return Stack(
          alignment:
              state is ImagecontrollerGetImage || type == CarAddEdit.editCar
                  ? Alignment.topLeft
                  : Alignment.center,
          children: [
            Container(
              height: 230.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  image: type == CarAddEdit.addCar
                      ? state is ImagecontrollerGetImage
                          ? DecorationImage(image: FileImage(File(state.path)))
                          : null
                      : state is ImagecontrollerGetImage
                          ? DecorationImage(image: FileImage(File(state.path)))
                          : DecorationImage(
                              image: NetworkImage(list!.imgUrl!))),
            ),
            state is ImagecontrollerInitial && type == CarAddEdit.addCar
                ? Container(
                    width: 100.w,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.circular(5.r)),
                    child: MaterialButton(
                      onPressed: () {
                        showSheet(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera,
                            size: 12.sp,
                          ),
                          sizedboxWidtht10,
                          Text(
                            "Add Photo",
                            style: TextStyle(fontSize: 9.sp),
                          )
                        ],
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      hoverColor: Colors.black,
                      onTap: () => showSheet(context),
                      child: const CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 20,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 19,
                          child: Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  )
          ],
        );
      },
    );
  }
}
