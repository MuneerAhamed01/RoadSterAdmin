
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/colors.dart';
import '../home_page.dart';

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({
    Key? key,
    required this.title,
    required this.details,
  }) : super(key: key);
  final String title;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
          color: containerColor2, borderRadius: rectangularRadius(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Text(title,
                style: GoogleFonts.rubik(
                    fontWeight: FontWeight.w500, fontSize: 15)),
            const Spacer(),
            Text(
              details,
              style:
                  GoogleFonts.rubik(fontWeight: FontWeight.w500, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}