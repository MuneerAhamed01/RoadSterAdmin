import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminText extends StatelessWidget {
  const AdminText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 30.w, top: 30.h),
      child: Text(
        "Welcome\nAdmin",
        style: GoogleFonts.rubik(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 38.sp),
      ),
    );
  }
}