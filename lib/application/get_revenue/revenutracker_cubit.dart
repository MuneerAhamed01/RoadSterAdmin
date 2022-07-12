import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:roadster_admin/domain/api/api_values.dart';
import 'package:roadster_admin/domain/models/revenu_model.dart';

import '../../main.dart';

part 'revenutracker_state.dart';

class RevenutrackerCubit extends Cubit<RevenutrackerState> {
  RevenutrackerCubit() : super(RevenutrackerInitial());

  getRevenue() async {
    emit(RevenutrackerInitial());
    ApiValues values = ApiValues();

    try {
      final revenue = await dio.get(values.revenue);

      final getValue = revenueGetFromJson(revenue.data);

      final revenueValue = getValue.revenu[0].sum;
      NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
      final valueWithComa = myFormat.format(revenueValue);

      emit(RevenutrackerValueOk(valueWithComa));
    } catch (e) {
      print(e.toString());
    }
  }
}
