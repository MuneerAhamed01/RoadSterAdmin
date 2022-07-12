import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:roadster_admin/domain/models/car_management_crud/get_all_car.dart';
import 'package:roadster_admin/main.dart';

part 'getcarlist_event.dart';
part 'getcarlist_state.dart';

class GetcarlistBloc extends Bloc<GetcarlistEvent, GetcarlistState> {
  GetcarlistBloc() : super(GetcarlistInitial()) {
    on<GetCarListStarted>((event, emit) async {
      emit(GetcarlistInitial());
      try {
        final response = await dio.get(values.carList);
     
        final data = getCarDataFromJson(response.data);

        emit(GetcarlistValuesOk(data.data));
      }on DioError  {
        emit(GetcarlistFailed());
      }
    });
  }
}
