import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigaionLogin());

  void onPressed(NavigationState statecoming) {
    emit(statecoming);
  }

  void onPressedDrawer(int index) {
    if (index == 0) {
      emit(NavigaionHome());
    } else if (index == 1) {
      emit(NavigationCar());
    } else if (index == 2) {
      emit(NavigationBooking());
    } else if (index == 3) {
      emit(NavigationUser());
    } else if (index == 4) {
      emit(NavigationCoupun());
    } else if (index == 5) {
      emit(NavigationOffer());
    } else if (index == 6) {
      emit(Navigationplace());
    } else if (index == 7) {
      emit(NavigaionLogin());
    }
  }

  void onPressedTails() {
    emit(NavigationDetails());
  }
}
