import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roadster_admin/application/adding_image/imagecontroller_cubit.dart';
import 'package:roadster_admin/domain/sizedboxes.dart';

Future<dynamic> showSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (ctx) => BlocProvider.value(
            value: context.read<ImagecontrollerCubit>(),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20.r))),
              height: 150.h,
              width: double.infinity,
              child: Column(
                children: [
                  sizedboxHeight10,
                  Text(
                    "Choose From",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
                  ),
                  sizedboxHeight10,
                  GestureDetector(
                    onTap: () async {
                      context
                          .read<ImagecontrollerCubit>()
                          .showImagePicker(ImageSource.camera);
                          Navigator.pop(ctx);
                    },
                    child: CameraView(
                      body: "Camera",
                      heading: Icons.camera,
                      color: Colors.green[900],
                    ),
                  ),
                  sizedboxHeight30,
                  GestureDetector(
                    onTap: () {
                      context
                          .read<ImagecontrollerCubit>()
                          .showImagePicker(ImageSource.gallery);
                      Navigator.pop(ctx);
                    },
                    child: const CameraView(
                      body: "Gallery",
                      heading: Icons.file_copy,
                      color: Colors.amber,
                    ),
                  )
                ],
              ),
            ),
          ));
}

class CameraView extends StatelessWidget {
  const CameraView(
      {Key? key,
      required this.body,
      required this.heading,
      required this.color})
      : super(key: key);
  final IconData heading;
  final String body;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Icon(
            heading,
            color: color,
          ),
          sizedboxWidtht20,
          Text(
            body,
            style: TextStyle(fontSize: 15.sp),
          )
        ],
      ),
    );
  }
}
