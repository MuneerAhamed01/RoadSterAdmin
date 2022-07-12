import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadster_admin/application/get_revenue/revenutracker_cubit.dart';
import 'package:roadster_admin/presentation/dashboard/home_page.dart';
import 'package:shimmer/shimmer.dart';

import '../../../domain/colors.dart';
import '../../../domain/sizedboxes.dart';

class Revenue extends StatelessWidget {
  const Revenue({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<RevenutrackerCubit>().getRevenue();
    return BlocBuilder<RevenutrackerCubit, RevenutrackerState>(
      builder: (context, state) {
        if (state is RevenutrackerInitial) {
          return Container(
            width: double.infinity,
            height: 150.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: rectangularRadius(10)),
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    highlightColor: Colors.grey[300]!,
                    baseColor: Colors.white,
                    child: Container(
                      color: Colors.white,
                      height: 20,
                      width: double.infinity,
                    ),
                  ),
                  sizedboxHeight30,
                  Shimmer.fromColors(
                      direction: ShimmerDirection.ltr,
                      highlightColor: Colors.grey[300]!,
                      baseColor: Colors.white,
                      child: Container(
                        color: Colors.white,
                        height: 20,
                        width: double.infinity,
                      ))
                ],
              ),
            ),
          );
        } else if (state is RevenutrackerValueOk) {
          return Container(
            width: double.infinity,
            height: 150.h,
            decoration: BoxDecoration(
                color: containerOne, borderRadius: rectangularRadius(10)),
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total Revenue :",
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.bold,
                      )),
                  sizedboxHeight30,
                  Text("💲${state.revenu}/-",
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w500, fontSize: 40.sp))
                ],
              ),
            ),
          );
        } else {
          return Text("no data");
        }
      },
    );
  }
}
