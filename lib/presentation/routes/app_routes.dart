import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadster_admin/application/addcardetails/addcars_cubit.dart';
import 'package:roadster_admin/application/adding_image/imagecontroller_cubit.dart';
import 'package:roadster_admin/application/deletecar/deletecar_cubit.dart';
import 'package:roadster_admin/application/districtdata/getdistricts_bloc.dart';
import 'package:roadster_admin/application/dropdown/dropdownitem_cubit.dart';
import 'package:roadster_admin/application/get_car_list/getcarlist_bloc.dart';
import 'package:roadster_admin/application/get_revenue/revenutracker_cubit.dart';
import 'package:roadster_admin/application/locator/locator_cubit.dart';
import 'package:roadster_admin/application/login_details/logindetails_cubit.dart';
import 'package:roadster_admin/application/showdate/show_date_cubit.dart';
import 'package:roadster_admin/application/splashscreennav/splashscreennavigate_cubit.dart';
import 'package:roadster_admin/application/visible_password/visiblepassword_cubit.dart';
import 'package:roadster_admin/domain/models/car_management_crud/get_all_car.dart';
import 'package:roadster_admin/domain/models/enums.dart';
import 'package:roadster_admin/presentation/bookings/booking_page.dart';
import 'package:roadster_admin/presentation/car_management/add_or_edit/add_or_edit.dart';
import 'package:roadster_admin/presentation/car_management/car_management_page.dart';
import 'package:roadster_admin/presentation/coupun_management/coupun_management_page.dart';
import 'package:roadster_admin/presentation/dashboard/home_page.dart';
import 'package:roadster_admin/presentation/login_page/login_page.dart';
import 'package:roadster_admin/presentation/offer_management/offer_management_page.dart';
import 'package:roadster_admin/presentation/place_management/place_management_page.dart';
import 'package:roadster_admin/presentation/user_management/user_details.dart';
import 'package:roadster_admin/presentation/user_management/user_management_page.dart';

import '../../application/navigationstate/navigation_cubit.dart';
import '../splashscreen/splash_screen.dart';

class AppRotes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => SplashscreennavigateCubit(),
                    ),
                    BlocProvider(
                      create: (context) => RevenutrackerCubit(),
                    )
                  ],
                  child: const SplashScreen(),
                ));
      case 'LoginPage':
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => VisiblepasswordCubit(),
                    ),
                    BlocProvider(
                      create: (context) => LogindetailsCubit(),
                    )
                  ],
                  child: LoginPage(),
                ));
      case 'HomePage':
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => VisiblepasswordCubit(),
                    ),
                    BlocProvider(
                      create: (context) => RevenutrackerCubit(),
                    ),
                  ],
                  child: const HomePageMain(),
                ));
      case "Bookings":
        return MaterialPageRoute(builder: (context) => const Bookings());
      case "User":
        return MaterialPageRoute(builder: (context) => const UserManage());

      case "car":
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => GetcarlistBloc(),
                    ),
                    BlocProvider(
                      create: (context) => DeletecarCubit(),
                    ),
                  ],
                  child: const CarManage(),
                ));

      case "Coupun":
        return MaterialPageRoute(builder: (context) => const CoupunManage());

      case "offer":
        return MaterialPageRoute(builder: (context) => const OfferManage());

      case "place":
        return MaterialPageRoute(builder: (context) => PlaceManage());
      case "customerdetails":
        return MaterialPageRoute(builder: (context) => const CostumorDetails());
      case "caradding":
        final args = settings.arguments as CarAddOrEditArgment;
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider(
                    create: (context) => DropdownitemCubit(),
                  ),
                  BlocProvider(
                    create: (context) => LocatorCubit(),
                  ),
                  BlocProvider(
                    create: (context) => ImagecontrollerCubit(),
                  ),
                  BlocProvider(create: (context) => AddcarsCubit()),
                   BlocProvider(create: (context) => ShowDateCubit()),
                   BlocProvider(create: (context) => GetdistrictsBloc())
                ], child: AddOREditCar(addEdit: args.addEdit,list: args.list,)));

      default:
        return MaterialPageRoute(builder: (context) => LoginPage());
    }
  }
}

class CarAddOrEditArgment {
  final CarAddEdit addEdit;
  final DataList? list;

CarAddOrEditArgment({required this.addEdit, this.list});
}
