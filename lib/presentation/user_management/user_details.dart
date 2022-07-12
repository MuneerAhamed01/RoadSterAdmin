import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadster_admin/domain/heading_text.dart';
import 'package:roadster_admin/domain/sizedboxes.dart';
import 'package:roadster_admin/presentation/user_management/widgets/details_text.dart';

class CostumorDetails extends StatelessWidget {
  const CostumorDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          title: const HeadingText(title: "Customer Details"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacementNamed(context, "User");
            },
          )),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          width: double.infinity,
          height: 500.h,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.r))),
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, top: 50.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomerDetailsText(
                  colorSelect: true,
                  text: "Name :",
                ),
                sizedboxHeight10,
                const CustomerDetailsText(
                    text: "Muneer Ahamed", colorSelect: false),
                sizedboxHeight30,
                const CustomerDetailsText(text: "E-mail :", colorSelect: true),
                sizedboxHeight10,
                const CustomerDetailsText(
                    text: "muneer6455@gmail.com", colorSelect: false),
                sizedboxHeight30,
                Row(
                  children: [
                    const RowTexts(
                      title: "Gender",
                      detail: "Male",
                    ),
                    sizedboxWidtht100,
                    const RowTexts(title: "District", detail: "Palakkad"),
                    sizedboxWidtht100,
                    const RowTexts(title: "Age", detail: "20"),
                  ],
                ),
                sizedboxHeight30,
                const CustomerDetailsText(text: "Address :", colorSelect: true),
                sizedboxHeight10,
                const CustomerDetailsText(
                    text:
                        "Variants It is available in two body styles - the 720S Coupé and the 720S Spider. Engine and Transmission ",
                    colorSelect: false),
                sizedboxHeight30,
                const CustomerDetailsText(
                    text: "Phone No :", colorSelect: true),
                sizedboxHeight10,
                const CustomerDetailsText(
                    text: "+91 8590124344", colorSelect: false),
                sizedboxHeight30,
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 45.h,
                    width: 140.w,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(8.r))),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.lock_outline),
                            sizedboxWidtht10,
                            const Text("BLOCK")
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
