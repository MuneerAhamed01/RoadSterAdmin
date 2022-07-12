import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:roadster_admin/domain/models/car_management_crud/get_all_car.dart';

part 'dropdownitem_state.dart';

class DropdownitemCubit extends Cubit<DropdownitemState> {
  DropdownitemCubit() : super(DropdownitemInitial("Petrol"));
  onChangeTheState(String value) {
    emit(DropdownitemInitial(value));
  }

  onInitalEdit(Fueltype value) {
    if (value == Fueltype.DIESEL) {
      emit(DropdownitemInitial("Diesel"));
    } else {
      emit(DropdownitemInitial("Petrol"));
    }
  }
}
