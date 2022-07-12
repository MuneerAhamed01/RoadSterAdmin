import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:roadster_admin/application/addcardetails/addcars_cubit.dart';
import 'package:roadster_admin/application/deletecar/deletecar_cubit.dart';
import 'package:roadster_admin/domain/models/car_management_crud/get_all_car.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../domain/colors.dart';
import '../../../domain/models/enums.dart';
import '../../../domain/sample_list_collection.dart';
import '../../routes/app_routes.dart';

class PlaceAndEdit extends StatelessWidget {
  const PlaceAndEdit({
    Key? key,
    required this.index,
    required this.place,
    required this.list,
  }) : super(key: key);
  final int index;
  final String place;
  final DataList list;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text("Place : $place",
              style: GoogleFonts.lato(
                fontSize: 10.sp,
                color: optionalText,
              )),
        ),
        const Spacer(),
        Container(
          width: 60.w,
          height: 25.h,
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, "caradding",
                  arguments: CarAddOrEditArgment(
                      addEdit: CarAddEdit.editCar, list: list));
            },
            child: Text(
              "Edit",
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 10.sp),
            ),
          ),
        )
      ],
    );
  }
}

class AmountAndName extends StatelessWidget {
  const AmountAndName({
    Key? key,
    required this.amount,
    required this.name,
  }) : super(key: key);
  final String amount;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          child: Text(
            name,
            style: GoogleFonts.roboto(
                fontSize: 14.sp, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Spacer(),
        Text(
          "💲$amount/day",
          style: TextStyle(fontSize: 14.sp),
        )
      ],
    );
  }
}

class IconOfDelete extends StatelessWidget {
  const IconOfDelete({
    Key? key,
    required this.id, required this.imageName,
  }) : super(key: key);
  final String id;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight.add(const Alignment(-0.1, 0)),
      child: GestureDetector(
        onTap: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext ctx) => BlocProvider.value(
              value: context.read<DeletecarCubit>(),
              child: AlertDialog(
                content: const Text('Are you sure'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(ctx, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () async {
                      await context.read<DeletecarCubit>().onPressed(id,imageName);
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacementNamed(ctx, "car");
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            ),
          );
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 2,
                  blurStyle: BlurStyle.normal,
                  offset: Offset.fromDirection(2, 3))
            ],
          ),
          child: const CircleAvatar(
            radius: 15,
            backgroundColor: colorPalette1,
            child: Icon(
              Icons.delete,
              size: 14,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
