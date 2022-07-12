import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:roadster_admin/domain/models/get_district_data/get_district.dart';
import 'package:roadster_admin/main.dart';

part 'getdistricts_event.dart';
part 'getdistricts_state.dart';

class GetdistrictsBloc extends Bloc<GetdistrictsEvent, GetdistrictsState> {
  GetdistrictsBloc() : super(GetdistrictsInitial()) {
    on<GetDistrict>((event, emit) async {
      emit(GetdistrictsOnprosses());
      try {
        final response = await dio.get(values.getDistrict);

       final data = getDistrictFromJson(response.data);
        print(data.getdata.toString());
        emit(GetdistrictsOnDone(data.getdata));
      } on DioError {
        print("object");
      }
    });
  }
}
