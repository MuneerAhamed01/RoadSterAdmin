import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadster_admin/domain/drawer.dart';
import '../../domain/colors.dart';
import '../../domain/costomized_button.dart';
import '../../domain/heading_text.dart';
import '../../domain/sizedboxes.dart';
import '../../domain/widgets/costomized_tail.dart';
import '../widgets/textfield.dart';

class CoupunManage extends StatelessWidget {
  const CoupunManage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: colorPalette1,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const HeadingText(title: "Coupun Management"),
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
                textFieldCustomized(label: "Coupun Name"),
                sizedboxHeight10,
                textFieldCustomized(label: "Code"),
                sizedboxHeight10,
                textFieldCustomized(label: "Discount Amount"),
                sizedboxHeight20,
                const CostomizedButton(
                  label: "Add Coupun",
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
                  title: "V1I2S3H4U",
                  codeTitle: "Code",
                  code: "	V1I2S3H4U".toLowerCase(),
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
