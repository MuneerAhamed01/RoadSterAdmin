import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:roadster_admin/application/login_details/logindetails_cubit.dart';
import 'package:roadster_admin/application/visible_password/visiblepassword_cubit.dart';
import 'package:roadster_admin/domain/colors.dart';
import 'package:roadster_admin/domain/sizedboxes.dart';
import 'package:roadster_admin/domain/validations/login_validations.dart';
import 'package:roadster_admin/presentation/login_page/heading_text.dart';
import 'package:roadster_admin/presentation/login_page/textfield.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogindetailsCubit, LogindetailsState>(
        listener: (context, state) {
      if (state is LoginSucessState) {
        Navigator.of(context).pushReplacementNamed("HomePage");
      } else if (state is LoginFailedState) {
        showTopSnackBar(
            context,
            const CustomSnackBar.error(
                message:
                    "Your Email or Password is not correct Please try again"));
      }else if(state is NetworkErroLogin){
          showTopSnackBar(
            context,
            const CustomSnackBar.info(
                message:
                    "Cheack your network connection and try again"));
      }
    }, builder: (context, state) {
      return Scaffold(
          body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/carLogin.webp"),
                    fit: BoxFit.cover)),
            width: double.infinity,
            height: 270.sp,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 606.727.h,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: colorPalette1,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LoginHeading(),
                  sizedboxHeight30,
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              textfieldLogin(
                                  inputType: TextInputType.emailAddress,
                                  controller: emailController,
                                  label: "E-mail",
                                  icon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.black,
                                    size: 30.sp,
                                  ),
                                  validator: (value) {
                                    return LoginValidation.emailValidations(
                                        value);
                                  }),
                              sizedboxHeight20,
                              BlocBuilder<VisiblepasswordCubit,
                                  VisiblepasswordState>(
                                builder: (context, state) {
                                  return textfieldLogin(
                                    controller: passwordController,
                                    validator: (p0) =>
                                        LoginValidation.passwordValidation(p0),
                                    
                                    suffix: SuffixIcon(
                                      iconData: state.icon,
                                    ),
                                    visible: state.visible,
                                    label: "Password",
                                    icon: Icon(
                                      Icons.lock_outline_rounded,
                                      color: Colors.black,
                                      size: 30.sp,
                                    ),
                                  );
                                },
                              ),
                              sizedboxHeight30,
                              SizedBox(
                                width: 250,
                                height: 45,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.black),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        FocusScope.of(context).unfocus();
                                        context
                                            .read<LogindetailsCubit>()
                                            .loginchecking(emailController.text,
                                                passwordController.text);
                                      }
                                    },
                                    child: state is LoginlodingState
                                        ? Lottie.asset(
                                            "assets/lottie/lf30_editor_i91fyzfc.json",
                                            animate: true,
                                            repeat: true,
                                            width: 100,
                                            height: 100)
                                        : const Text('Log in')),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ));
    });
  }
}
