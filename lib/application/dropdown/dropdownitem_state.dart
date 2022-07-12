part of 'dropdownitem_cubit.dart';

@immutable
abstract class DropdownitemState {}

class DropdownitemInitial extends DropdownitemState {
  final String item;

  DropdownitemInitial(this.item);
}
