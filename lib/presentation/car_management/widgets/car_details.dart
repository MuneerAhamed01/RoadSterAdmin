import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadster_admin/domain/models/car_management_crud/get_all_car.dart';
import 'package:roadster_admin/presentation/car_management/widgets/text_details.dart';

import '../../../domain/sizedboxes.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({
    Key? key,
    required this.index,
    required this.list,
  }) : super(key: key);
  final int index;
  final List<DataList> list;
  @override
  Widget build(BuildContext context) {
    // print(list[index].id);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
      ),
      child: Column(
        children: [
          IconOfDelete(
            id: list[index].id,
            imageName: list[index].imgName!,
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  list[index].imgUrl ??
                      "https://firebasestorage.googleapis.com/v0/b/car-rental-booking-a5524.appspot.com/o/carImages%2FimageOfSvg.png?alt=media&token=222720dc-58f6-4014-a080-312d5e8973a2",
                ),
              ),
            ),
            height: 100.h,
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                AmountAndName(
                  amount: list[index].price.toString(),
                  name: list[index].brand,
                ),
                sizedboxHeight20,
                PlaceAndEdit(
                  list: list[index],
                  place: list[index].location!,
                  index: index,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
