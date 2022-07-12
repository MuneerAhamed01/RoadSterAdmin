import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';
import '../sizedboxes.dart';

class CostomizedGridTail extends StatelessWidget {
  const CostomizedGridTail({
    Key? key,
    required this.index,
    required this.title,
    required this.codeTitle,
    required this.code,
    required this.amount,
  }) : super(key: key);
  final int index;
  final String title;
  final String codeTitle;
  final String code;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.r))),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
                  GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            sizedboxHeight20,
            Text(
              "$codeTitle :",
              style: TextStyle(color: optionalText, fontSize: 13.sp),
            ),
            SizedBox(
              height: 5,
            ),
            Text(code),
            sizedboxHeight30,
            Text("💲 $amount/-",
                style: GoogleFonts.openSans(color: Colors.blue, fontSize: 18))
          ],
        ),
      ),
    );
  }
}
