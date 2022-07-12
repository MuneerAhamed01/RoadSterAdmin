import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadster_admin/application/get_revenue/revenutracker_cubit.dart';
import 'package:roadster_admin/application/navigationstate/navigation_cubit.dart';
import 'package:roadster_admin/domain/colors.dart';
import 'package:roadster_admin/domain/heading_text.dart';
import 'package:roadster_admin/domain/sizedboxes.dart';
import 'package:roadster_admin/presentation/dashboard/widgets/chart_view.dart';
import 'package:roadster_admin/presentation/dashboard/widgets/details_view.dart';
import 'package:roadster_admin/presentation/dashboard/widgets/revenue_text.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../domain/drawer.dart';
import '../../domain/navigation_drawer.dart';

class HomePageMain extends StatelessWidget {
  const HomePageMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigationCubit, NavigationState>(
      listener: (context, state) {
        
        gotoNavigation(state, context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const HeadingText(title: "DashBoard"),
          centerTitle: true,
          shadowColor: Colors.transparent,
          backgroundColor: colorPalette1,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        drawer: const CustomizedDrawer(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                sizedboxHeight10,
                const Revenue(),
                sizedboxHeight20,
                const ChartList(),
                sizedboxHeight20,
                const DetailsContainer(
                  title: "Total Users :",
                  details: "20",
                ),
                sizedboxHeight10,
                const DetailsContainer(title: "Total Cars :", details: "10"),
                sizedboxHeight10,
                const DetailsContainer(
                    title: "Max Car Used :", details: "Toyoto"),
                sizedboxHeight10,
                const DetailsContainer(title: "Min Car Used :", details: "BMW"),
                sizedboxHeight10
              ],
            ),
          ),
        ),
      ),
    );
  }
}

BorderRadius rectangularRadius(double radius) =>
    BorderRadius.all(Radius.circular(radius.r));
