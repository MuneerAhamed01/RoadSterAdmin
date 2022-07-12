import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'show_date_state.dart';

class ShowDateCubit extends Cubit<ShowDateState> {
  ShowDateCubit() : super(ShowDateInitial());

  void showDatePick(BuildContext context) async {
    final date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());

    if (date != null) {
      final formated = DateFormat("dd MMMM yyyy").format(date);
      emit(ShowDateSaved(formated));
    }
  }
}
