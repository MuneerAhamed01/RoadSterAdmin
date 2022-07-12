import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:roadster_admin/application/deletecar/deletecar_cubit.dart';
import 'package:roadster_admin/application/get_car_list/getcarlist_bloc.dart';
import 'package:roadster_admin/application/navigationstate/navigation_cubit.dart';
import 'package:roadster_admin/domain/colors.dart';
import 'package:roadster_admin/domain/heading_text.dart';
import 'package:roadster_admin/domain/models/car_management_crud/get_all_car.dart';
import 'package:roadster_admin/domain/models/enums.dart';
import 'package:roadster_admin/domain/navigation_drawer.dart';
import 'package:roadster_admin/domain/sizedboxes.dart';
import 'package:roadster_admin/presentation/car_management/widgets/car_details.dart';
import 'package:roadster_admin/presentation/routes/app_routes.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../domain/drawer.dart';

class CarManage extends StatelessWidget {
  const CarManage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GetcarlistBloc>().add(GetCarListStarted());
    return MultiBlocListener(
      listeners: [
        BlocListener<NavigationCubit, NavigationState>(
          listener: (context, state) {
            gotoNavigation(state, context);
          },
        ),
        BlocListener<DeletecarCubit, DeletecarState>(
          listener: (context, state) {
            if (state is DeletecarProcess) {
              showDialog<String>(
                context: context,
                builder: (BuildContext ctx) => BlocProvider.value(
                  value: context.read<DeletecarCubit>(),
                  child: AlertDialog(
                    content: Lottie.asset("assets/lottie/lootiedefault.json",
                        width: 100, height: 100),
                  ),
                ),
              );
            } else if (state is DeletecarDeleted) {
              showTopSnackBar(context,
                  const CustomSnackBar.success(message: "Delete Sucessfully"));
              Navigator.pushReplacementNamed(context, "car");
            }
          },
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: colorPalette1,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const HeadingText(title: "Car Management"),
          centerTitle: true,
        ),
        drawer: const CustomizedDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              sizedboxHeight30,
              BlocBuilder<GetcarlistBloc, GetcarlistState>(
                builder: (context, state) {
                  if (state is GetcarlistInitial) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 200),
                      child: Center(
                          child: Lottie.asset(
                              "assets/lottie/35070-car-loading.json",
                              height: 200,
                              width: 200)),
                    );
                  } else if (state is GetcarlistValuesOk) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: GridView.builder(
                        controller: ScrollController(),
                        itemCount: state.dataList.length,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.76,
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10),
                        itemBuilder: (context, index) => CarDetails(
                          index: index,
                          list: state.dataList,
                        ),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(top: 170),
                      child: Column(
                        children: [
                          Center(
                            child: Lottie.asset(
                              "assets/lottie/1167-failed.json",
                            ),
                          ),
                          Text(
                            "Something went wrong.Plese try again",
                            style:
                                GoogleFonts.rubik(fontWeight: FontWeight.w500),
                          ),
                          sizedboxHeight10,
                          ElevatedButton(
                              onPressed: () {
                                context
                                    .read<GetcarlistBloc>()
                                    .add(GetCarListStarted(),);
                              },
                              child: const Text("Try again"),)
                        ],
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "caradding",
                arguments: CarAddOrEditArgment(addEdit: CarAddEdit.addCar));
          },
          backgroundColor: Colors.black,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
