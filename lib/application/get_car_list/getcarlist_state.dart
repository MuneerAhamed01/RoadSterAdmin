part of 'getcarlist_bloc.dart';

@immutable
abstract class GetcarlistState {}

class GetcarlistInitial extends GetcarlistState {}
class GetcarlistFailed extends GetcarlistState {}

class GetcarlistValuesOk extends GetcarlistState {
 final List<DataList> dataList;

  GetcarlistValuesOk(this.dataList);
}
