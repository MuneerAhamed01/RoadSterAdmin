import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadster_admin/domain/drawer.dart';
import 'package:roadster_admin/domain/sample_list_collection.dart';
import 'package:roadster_admin/domain/sizedboxes.dart';
import 'package:roadster_admin/domain/heading_text.dart';

import '../../domain/colors.dart';
import '../widgets/textfield.dart';

class PlaceManage extends StatelessWidget {
  PlaceManage({Key? key}) : super(key: key);

  // TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const HeadingText(
            title: "Place Management",
          ),
          shadowColor: Colors.transparent,
          backgroundColor: colorPalette1,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        drawer: const CustomizedDrawer(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 40.h),
                child: textFieldCustomized(label: "Place Management"),
              ),
              sizedboxHeight10,
              Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: SizedBox(
                  width: 80.w,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: const Text("Add"),
                  ),
                ),
              ),
              sizedboxHeight50,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: GridView.builder(
                  controller: ScrollController(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1, crossAxisCount: 3),
                  itemBuilder: (context, index) => Card(
                    child: GridTile(
                        child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        district[index],
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold, fontSize: 12.sp),
                        textAlign: TextAlign.center,
                      ),
                    )),
                  ),
                  itemCount: district.length,
                ),
              )
            ],
          ),
        ));
  }
}
