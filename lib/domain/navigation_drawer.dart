import 'package:flutter/cupertino.dart';
import 'package:roadster_admin/application/navigationstate/navigation_cubit.dart';

gotoNavigation(NavigationState state, BuildContext context) {
  if (state is NavigaionHome) {
    Navigator.pushNamed(context, "HomePage");
  } else if (state is NavigationBooking) {
    Navigator.pushNamed(context, "Bookings");
  } else if (state is NavigationCar) {
    Navigator.pushNamed(context, "car");
  } else if (state is NavigationCoupun) {
    Navigator.pushNamed(context, "Coupun");
  } else if (state is NavigationUser) {
    Navigator.pushNamed(context, "User");
  } else if (state is NavigationOffer) {
    Navigator.pushNamed(context, "offer");
  } else if (state is Navigationplace) {
    Navigator.pushNamed(context, "place");
  } else if (state is NavigaionLogin) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      "LoginPage",
      (route) => false,
    );
  } else if (state is NavigationDetails) {
    Navigator.pushNamed(context, "customerdetails");
  } else if (state is NavigationEdit) {
    Navigator.pushNamed(context, "caraddig");
  }
}
