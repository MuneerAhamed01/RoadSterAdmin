part of 'logindetails_cubit.dart';

@immutable
abstract class LogindetailsState {}

class LoginDetailsCheck extends LogindetailsState {}

class LoginSucessState extends LogindetailsState {}

class LoginFailedState extends LogindetailsState {}

class LoginlodingState extends LogindetailsState {}

class NetworkErroLogin extends LogindetailsState {}
