import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadster_admin/domain/api/api_values.dart';
import 'package:roadster_admin/domain/colors.dart';
import 'package:roadster_admin/presentation/routes/app_routes.dart';

import 'application/navigationstate/navigation_cubit.dart';

late Dio dio;
late ApiValues values;

void main() async {
  

  values = ApiValues();

  dio = Dio(
      BaseOptions(responseType: ResponseType.plain, baseUrl: values.baseUrl));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(392.72727272727275, 856.7272727272727),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocProvider(
            create: (context) => NavigationCubit(),
            child: MaterialApp(
              builder: (context, child) => MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                  child: child!),
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                canvasColor: Colors.transparent,
                scaffoldBackgroundColor: colorPalette1,
                primarySwatch: Colors.blue,
              ),
              onGenerateRoute: AppRotes.generateRoute,
            ),
          );
        });
  }
}
