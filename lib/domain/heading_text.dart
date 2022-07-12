
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
          GoogleFonts.roboto(color: Colors.black, fontWeight: FontWeight.w500),
    );
  }
}