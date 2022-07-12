part of 'addcars_cubit.dart';

@immutable
abstract class AddcarsState {}

class AddcarsInitial extends AddcarsState {}
class AddcarsProssed extends AddcarsState {}
class AddcarsFailed extends AddcarsState {}
