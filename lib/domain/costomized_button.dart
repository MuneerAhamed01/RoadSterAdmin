import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadster_admin/domain/sizedboxes.dart';

import 'colors.dart';

class CostomizedButton extends StatelessWidget {
  const CostomizedButton({
    Key? key, required this.label,
  }) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.all(Radius.circular(5.r))),
      child: MaterialButton(
        onPressed: () {
          print("I am working");
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add_to_photos_rounded),
            sizedboxWidtht10,
             Text(label)
          ],
        ),
      ),
    );
  }
}
