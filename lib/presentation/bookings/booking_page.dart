import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadster_admin/domain/heading_text.dart';
import 'package:roadster_admin/domain/sizedboxes.dart';

import '../../domain/colors.dart';
import '../../domain/drawer.dart';

class Bookings extends StatelessWidget {
  const Bookings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.filter_list_alt))
          ],
          shadowColor: Colors.transparent,
          backgroundColor: colorPalette1,
          title: const HeadingText(title: "Booking History"),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        drawer: const CustomizedDrawer(),
        body: ListView(
          children: [
            sizedboxHeight30,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.separated(
                controller: ScrollController(),
                separatorBuilder: (context, index) => sizedboxHeight10,
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Theme(
                    data:
                        ThemeData().copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      expandedAlignment: Alignment.topLeft,
                      title: Text(
                        "Toyoto",
                        style: GoogleFonts.roboto(),
                      ),
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomerDetailsHistory(
                                  title: "Name :", details: "Muneer Ahamed"),
                              sizedboxHeight20,
                              const CustomerDetailsHistory(
                                  title: "Start on :", details: "02-01-2022"),
                              sizedboxHeight20,
                              const CustomerDetailsHistory(
                                  title: "Ends on :", details: "02-01-2022"),
                              sizedboxHeight20,
                              const CustomerDetailsHistory(
                                  title: "Place", details: "Kochi"),
                              sizedboxHeight20,
                              const Divider(
                                color: Colors.black,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "💲 1000/-",
                                    style: GoogleFonts.openSans(
                                        color: Colors.blue, fontSize: 20),
                                  ),
                                  const Spacer(),
                                  TextButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.done,
                                      color: Colors.green,
                                    ),
                                    label: const Text(
                                      "Completed",
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                itemCount: 10,
              ),
            )
          ],
        ));
  }
}

class CustomerDetailsHistory extends StatelessWidget {
  const CustomerDetailsHistory({
    Key? key,
    required this.title,
    required this.details,
  }) : super(key: key);
  final String title;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.roboto(color: optionalText),
        ),
        const Spacer(),
        Text(
          details,
          style: GoogleFonts.roboto(fontSize: 14),
        )
      ],
    );
  }
}
