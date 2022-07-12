part of 'imagecontroller_cubit.dart';

@immutable
abstract class ImagecontrollerState {}

class ImagecontrollerInitial extends ImagecontrollerState {}

class ImagecontrollerGetImage extends ImagecontrollerState {
  final String path;
  final String name;

  ImagecontrollerGetImage(this.path,this.name);
}
