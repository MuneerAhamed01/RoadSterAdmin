part of 'getdistricts_bloc.dart';

@immutable
abstract class GetdistrictsState {}

class GetdistrictsInitial extends GetdistrictsState {}

class GetdistrictsOnprosses extends GetdistrictsState {}

class GetdistrictsOnDone extends GetdistrictsState {
 final  List<Getdatum> district;

  GetdistrictsOnDone(this.district);
}
