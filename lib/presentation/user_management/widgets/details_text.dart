import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/colors.dart';
import '../../../domain/sizedboxes.dart';

class CustomerDetailsText extends StatelessWidget {
  const CustomerDetailsText({
    Key? key,
    required this.text,
    required this.colorSelect,
  }) : super(key: key);
  final String text;
  final bool colorSelect;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
          color: colorSelect ? optionalText : Colors.black, fontSize: 14.sp),
    );
  }
}
class RowTexts extends StatelessWidget {
  const RowTexts({
    Key? key,
    required this.title,
    required this.detail,
  }) : super(key: key);
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomerDetailsText(text: title, colorSelect: true),
        sizedboxHeight10,
        CustomerDetailsText(text: detail, colorSelect: false)
      ],
    );
  }
}