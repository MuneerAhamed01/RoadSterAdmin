part of 'deletecar_cubit.dart';

@immutable
abstract class DeletecarState {}

class DeletecarInitial extends DeletecarState {}
class DeletecarDeleted extends DeletecarState {}
class DeletecarError extends DeletecarState {}
class DeletecarProcess extends DeletecarState {}
