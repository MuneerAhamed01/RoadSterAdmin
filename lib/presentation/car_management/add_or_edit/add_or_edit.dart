import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:roadster_admin/application/addcardetails/addcars_cubit.dart';
import 'package:roadster_admin/application/adding_image/imagecontroller_cubit.dart';
import 'package:roadster_admin/application/districtdata/getdistricts_bloc.dart';
import 'package:roadster_admin/application/dropdown/dropdownitem_cubit.dart';
import 'package:roadster_admin/application/locator/locator_cubit.dart';
import 'package:roadster_admin/application/showdate/show_date_cubit.dart';
import 'package:roadster_admin/domain/heading_text.dart';
import 'package:roadster_admin/domain/models/car_management_crud/get_all_car.dart';
import 'package:roadster_admin/domain/models/enums.dart';
import 'package:roadster_admin/domain/sizedboxes.dart';
import 'package:roadster_admin/presentation/car_management/add_or_edit/widget/image.dart';
import 'package:roadster_admin/presentation/widgets/textfield.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AddOREditCar extends StatefulWidget {
  const AddOREditCar({Key? key, required this.addEdit, this.list})
      : super(key: key);
  final CarAddEdit addEdit;
  final DataList? list;

  @override
  State<AddOREditCar> createState() => _AddOREditCarState();
}

class _AddOREditCarState extends State<AddOREditCar> {
  final TextEditingController brandcontroller = TextEditingController();

  final TextEditingController modelNocontroller = TextEditingController();

  final TextEditingController registerNocontroller = TextEditingController();

  final TextEditingController carNocontroller = TextEditingController();

  String fueltype = "Petrol";

  final TextEditingController pricecontroller = TextEditingController();

  final TextEditingController registerDatecontroller = TextEditingController();

  final TextEditingController latituecontroller = TextEditingController();

  final TextEditingController longitudecontroller = TextEditingController();

  final TextEditingController districtcontroller = TextEditingController();

  final TextEditingController seatscontroller = TextEditingController();

  final TextEditingController milagecontroller = TextEditingController();

  final TextEditingController descriptioncontroller = TextEditingController();

  final TextEditingController controller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  File? imagePath;
  late String imageName;
  late CarAddEdit isAddOREdit;
  @override
  void initState() {
    context.read<GetdistrictsBloc>().add(GetDistrict());
    isAddOREdit = widget.addEdit;
    if (widget.addEdit == CarAddEdit.editCar) {
      modelNocontroller.text = widget.list!.model;
      registerNocontroller.text = widget.list!.regNo;
      imageName = widget.list!.imgName!;
      pricecontroller.text = widget.list!.price.toString();
      registerDatecontroller.text = widget.list!.register!;
      latituecontroller.text = widget.list!.latitude.toString();
      longitudecontroller.text = widget.list!.longitude.toString();
      districtcontroller.text = widget.list!.location!;
      seatscontroller.text = widget.list!.seats.toString();
      milagecontroller.text = widget.list!.mileage!;
      descriptioncontroller.text = widget.list!.description!;
      brandcontroller.text = widget.list!.brand;
      context.read<DropdownitemCubit>().onInitalEdit(widget.list!.fueltype!);
      context.read<LocatorCubit>().editCar(widget.list!.latitude!.toDouble(),
          widget.list!.longitude!.toDouble(), widget.list!.location!);

      log(widget.list!.fueltype.toString());
    }

    super.initState();
  }

  // TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (isAddOREdit == CarAddEdit.addCar) {
      context.read<LocatorCubit>().getPosition();
    }

    return MultiBlocListener(
        listeners: [
          BlocListener<ImagecontrollerCubit, ImagecontrollerState>(
            listener: (context, state) {
              if (state is ImagecontrollerGetImage) {
                imagePath = File(state.path);
                if (widget.addEdit == CarAddEdit.addCar) {
                  imageName = state.name;
                }
              }
            },
          ),
          BlocListener<AddcarsCubit, AddcarsState>(
            listener: (ctx, state) {
              showDialog(
                  context: context,
                  builder: (ct) {
                    return AlertDialog(
                      content: Lottie.asset(
                        state is AddcarsInitial
                            ? "assets/lottie/lootiedefault.json"
                            : state is AddcarsFailed
                                ? "assets/lottie/1167-failed.json"
                                : "assets/lottie/sucess.json",
                        animate: true,
                        repeat: true,
                        width: 100,
                        height: 100,
                      ),
                      actions: [
                        state is AddcarsFailed
                            ? TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, "car");
                                },
                                child: const Text("Done"))
                            : state is AddcarsFailed
                                ? TextButton(
                                    onPressed: () {
                                      Navigator.pop(ct);
                                      Navigator.pop(ct);
                                    },
                                    child: const Text("Ok"))
                                : Container()
                      ],
                    );
                  });
              if (state is AddcarsProssed) {
                Future.delayed(const Duration(milliseconds: 1000)).then(
                    (value) => Navigator.pushReplacementNamed(context, "car"));
                showTopSnackBar(
                    context,
                    const CustomSnackBar.success(
                        message: "Process sucessfull"));
              } else if (state is AddcarsFailed) {
                showTopSnackBar(
                    context,
                    const CustomSnackBar.error(
                        message:
                            "Oops! Something went wrong.Please try again"));
              }
            },
          ),
          BlocListener<ShowDateCubit, ShowDateState>(
            listener: (context, state) {
              if (state is ShowDateSaved) {
                registerDatecontroller.text = state.formatedDate;
              }
            },
            child: Container(),
          )
        ],
        child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            title: const HeadingText(title: "Add details"),
            centerTitle: true,
            shadowColor: const Color.fromARGB(0, 177, 58, 58),
            backgroundColor: Colors.transparent,
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
              child: SingleChildScrollView(
                  child: BlocConsumer<LocatorCubit, LocatorState>(
                      listener: (ctx, state) {
                // print("object");
                if (state is LocatorLoaded) {
                  if (state.place == null) {
                    showTopSnackBar(
                        context,
                        const CustomSnackBar.info(
                            message: "Enter the valid Coodinates"));
                  } else if (state.latitude.toString() == "0.00") {
                    print(
                        "-----------------------------------------------object");
                    showTopSnackBar(
                        context,
                        const CustomSnackBar.info(
                            message: "Enter the valid Place"));
                  }
                }
              }, builder: (context, state) {
                if (state is LocatorInitial) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: Center(
                        child: Lottie.asset(
                            "assets/lottie/35070-car-loading.json",
                            height: 200,
                            width: 200)),
                  );
                } else if (state is LocatorLoaded ||
                    state is LocatorFromCoodinateLoading) {
                  latituecontroller.text = state is LocatorLoaded
                      ? state.latitude.toString()
                      : "Searching..";
                  longitudecontroller.text = state is LocatorLoaded
                      ? state.longitude.toString()
                      : "Searching..";
                  districtcontroller.text = state is LocatorLoaded
                      ? state.place!
                      : state is LocatorFromCoodinateLoading
                          ? state.place
                          : "Searching...";
                  return Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageShower(
                          type: widget.addEdit,
                          list: widget.list,
                        ),
                        sizedboxHeight10,
                        textHeadingDetails(
                          text: "Personal Details",
                        ),
                        sizedboxHeight10,
                        textFieldCustomizedFroDetails(
                            label: "Brand Name", controller: brandcontroller),
                        sizedboxHeight10,
                        textFieldCustomizedFroDetails(
                            label: "Model No.", controller: modelNocontroller),
                        sizedboxHeight10,
                        textFieldCustomizedFroDetails(
                            label: "Register No",
                            controller: registerNocontroller),
                        sizedboxHeight10,
                        Row(
                          children: [
                            Container(
                              height: 45,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.black, width: 0.8)),
                              child: BlocBuilder<DropdownitemCubit,
                                  DropdownitemState>(
                                builder: (context, state) {
                                  state as DropdownitemInitial;
                                  fueltype == state.item;
                                  return DropdownButton<String>(
                                    dropdownColor: Colors.white,
                                    elevation: 1,
                                    alignment: Alignment.centerLeft,
                                    underline: const Divider(
                                        color: Colors.transparent),
                                    // Initial Value

                                    hint: Padding(
                                      padding: EdgeInsets.only(left: 10.w),
                                      child: const Text(
                                        "Fuel Type",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    // Down Arrow Icon
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                    ),
                                    value: state.item,
                                    // Array list of items
                                    items: list.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            items,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (String? newValue) {
                                      fueltype = newValue!;
                                      context
                                          .read<DropdownitemCubit>()
                                          .onChangeTheState(newValue);
                                    },
                                  );
                                },
                              ),
                            ),
                            sizedboxWidtht20,
                            SizedBox(
                                width: 140,
                                // height: 45,
                                child: textFieldCustomizedFroDetails(
                                    controller: pricecontroller,
                                    label: "Price/day",
                                    type: TextInputType.number))
                          ],
                        ),
                        sizedboxHeight10,
                        BlocBuilder<ShowDateCubit, ShowDateState>(
                          builder: (context, state) {
                            return textFieldCustomizedFroDetails(
                              readOnly: true,
                              onTap: () {
                                context
                                    .read<ShowDateCubit>()
                                    .showDatePick(context);
                              },
                              controller: registerDatecontroller,
                              label: "Registration Date",
                            );
                          },
                        ),
                        sizedboxHeight10,
                        textHeadingDetails(text: "Location"),
                        sizedboxHeight10,
                        Row(
                          children: [
                            SizedBox(
                                width: 170,
                                child: textFieldCustomizedFroDetails(
                                    onChanged: (p0) => context
                                        .read<LocatorCubit>()
                                        .getPositionByCoodinate(
                                            double.tryParse(p0)!,
                                            double.tryParse(
                                                longitudecontroller.text)!),
                                    controller: latituecontroller,
                                    readOnly: true,
                                    label: "Latitude",
                                    type: TextInputType.number)),
                            sizedboxWidtht20,
                            SizedBox(
                                width: 170,
                                child: textFieldCustomizedFroDetails(
                                    readOnly: true,
                                    onChanged: (p1) => context
                                        .read<LocatorCubit>()
                                        .getPositionByCoodinate(
                                            double.tryParse(
                                                latituecontroller.text)!,
                                            double.tryParse(p1)!),
                                    controller: longitudecontroller,
                                    label: "Longitude",
                                    type: TextInputType.number)),
                          ],
                        ),
                        sizedboxHeight10,
                        BlocBuilder<GetdistrictsBloc, GetdistrictsState>(
                          builder: (context, state) {
                            return textFieldCustomizedFroDetails(
                                type: TextInputType.name,
                                onChanged: (p0) => context
                                    .read<LocatorCubit>()
                                    .fromAddressToCoodinate(p0),
                                label: "District",
                                controller: districtcontroller,
                                specialValidate: state is GetdistrictsOnDone
                                    ? state.district
                                    : null);
                          },
                        ),
                        sizedboxHeight10,
                        textHeadingDetails(text: "Additional Details"),
                        sizedboxHeight10,
                        Row(
                          children: [
                            SizedBox(
                                width: 170,
                                child: textFieldCustomizedFroDetails(
                                    controller: seatscontroller,
                                    label: "No. of seats",
                                    type: TextInputType.number)),
                            sizedboxWidtht20,
                            SizedBox(
                                width: 170,
                                child: textFieldCustomizedFroDetails(
                                    type: TextInputType.number,
                                    controller: milagecontroller,
                                    label: "Milage")),
                          ],
                        ),
                        sizedboxHeight10,
                        textFieldCustomizedFroDetails(
                            controller: descriptioncontroller,
                            label: "Description",
                            maxline: 6),
                        sizedboxHeight10,
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5)),
                          child: MaterialButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                if (widget.addEdit == CarAddEdit.addCar) {
                                  if (imagePath != null) {
                                    context
                                        .read<AddcarsCubit>()
                                        .prosessCarDetails(
                                          latitue: latituecontroller.text,
                                          longitue: longitudecontroller.text,
                                          brand: brandcontroller.text,
                                          model: modelNocontroller.text,
                                          fuelType: fueltype,
                                          regNo: registerNocontroller.text,
                                          price:
                                              int.parse(pricecontroller.text),
                                          seat: int.parse(seatscontroller.text),
                                          location: districtcontroller.text,
                                          milage:
                                              int.parse(milagecontroller.text),
                                          registerDate:
                                              registerDatecontroller.text,
                                          descreiption:
                                              descriptioncontroller.text,
                                          url: imagePath!,
                                          imageName: imageName,
                                          longdescription:
                                              "The car has no long descriptions",
                                        );
                                  } else {
                                    showTopSnackBar(
                                        context,
                                        const CustomSnackBar.error(
                                            message:
                                                "Add image and Try again.."));
                                  }
                                } else {
                                  context
                                      .read<AddcarsCubit>()
                                      .prosessCarDetailsUpdate(
                                        list: widget.list!,
                                        id: widget.list!.id,
                                        latitue: latituecontroller.text,
                                        longitue: longitudecontroller.text,
                                        brand: brandcontroller.text,
                                        model: modelNocontroller.text,
                                        fuelType: fueltype,
                                        regNo: registerNocontroller.text,
                                        price: int.parse(pricecontroller.text),
                                        seat: int.parse(seatscontroller.text),
                                        location: districtcontroller.text,
                                        milage:
                                            int.parse(milagecontroller.text),
                                        registerDate:
                                            registerDatecontroller.text,
                                        descreiption:
                                            descriptioncontroller.text,
                                        url: imagePath,
                                        imageName: imageName,
                                        longdescription:
                                            "The car has no long descriptions",
                                      );
                                }
                              } else {
                                showTopSnackBar(
                                    context,
                                    const CustomSnackBar.error(
                                        message: "Fill the Fields Properly"));
                              }
                            },
                            child: const Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        sizedboxHeight50
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              })),
            ),
          ),
        ));
  }

  Text textHeadingDetails({required String text}) {
    return Text(
      "$text :",
      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13.sp),
    );
  }
}

List<String> list = ["Petrol", "Diesel"];
