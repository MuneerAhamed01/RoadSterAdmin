import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';

part 'visiblepassword_state.dart';

class VisiblepasswordCubit extends Cubit<VisiblepasswordState> {
  VisiblepasswordCubit()
      : super(VisiblepasswordState(visible: true, icon: Icons.visibility));

  void onChangeVisible() {
    IconData visible;

    if (state.visible) {
      visible = Icons.visibility_off;
    } else {
      visible = Icons.visibility;
    }
    emit(VisiblepasswordState(visible: !state.visible, icon: visible));
  }
}
