import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadster_admin/domain/drawer.dart';
import 'package:roadster_admin/domain/heading_text.dart';
import 'package:roadster_admin/domain/sample_list_collection.dart';
import 'package:roadster_admin/domain/sizedboxes.dart';
import 'package:roadster_admin/presentation/widgets/textfield.dart';
import '../../domain/colors.dart';
import '../../domain/costomized_button.dart';
import '../../domain/widgets/costomized_tail.dart';

class OfferManage extends StatelessWidget {
  const OfferManage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: colorPalette1,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const HeadingText(title: "Offer Management"),
        centerTitle: true,
      ),
      drawer: const CustomizedDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 40.h),
            child: Column(
              children: [
                textFieldCustomized(label: "Offer Name"),
                sizedboxHeight10,
                textFieldCustomized(label: "District"),
                sizedboxHeight10,
                textFieldCustomized(label: "Discount Amount"),
                sizedboxHeight20,
                const CostomizedButton(
                  label: "Add Offer",
                )
              ],
            ),
          ),
          sizedboxHeight10,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                controller: ScrollController(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1),
                itemBuilder: (context, index) => CostomizedGridTail(
                  title: "Kannur Mega Offer",
                  codeTitle: "District",
                  code: district[index],
                  amount: "1000",
                  index: index,
                ),
                itemCount: 7,
              ),
            ),
          )
        ],
      ),
    );
  }
}
