part of 'show_date_cubit.dart';

@immutable
abstract class ShowDateState {}

class ShowDateInitial extends ShowDateState {}

class ShowDateSaved extends ShowDateState {
  final String formatedDate;

  ShowDateSaved(this.formatedDate);
}
