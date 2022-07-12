part of 'revenutracker_cubit.dart';

@immutable
abstract class RevenutrackerState {}

class RevenutrackerInitial extends RevenutrackerState {}

class RevenutrackerValueOk extends RevenutrackerState {
  final String revenu;

  RevenutrackerValueOk(this.revenu);
}
