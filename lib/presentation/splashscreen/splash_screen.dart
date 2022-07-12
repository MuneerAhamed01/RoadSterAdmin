import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:roadster_admin/application/get_car_list/getcarlist_bloc.dart';
import 'package:roadster_admin/application/get_revenue/revenutracker_cubit.dart';
import 'package:roadster_admin/application/splashscreennav/splashscreennavigate_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
  
    super.initState();
    context.read<SplashscreennavigateCubit>().changeScreen();
    // context.read<RevenutrackerCubit>().getRevenue();
  }

  @override
  Widget build(BuildContext context) {
    // context.read<SplashscreennavigateCubit>().changeScreen();

    return BlocListener<SplashscreennavigateCubit, SplashscreennavigateState>(
      listener: (context, state) {
        if (state is SplashscreenLogin) {
          Navigator.pushNamedAndRemoveUntil(
              context, "LoginPage", (route) => false);
        } else if (state is SplashscreenHome) {
          Navigator.pushNamedAndRemoveUntil(
              context, "HomePage", (route) => false);
        }
      },
      child: Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Lottie.asset("assets/lottie/35070-car-loading.json"),
          const Text(
            "Please wait.....",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ]),
      ),
    );
  }
}
