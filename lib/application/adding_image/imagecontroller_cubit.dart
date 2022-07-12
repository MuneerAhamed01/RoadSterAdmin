import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'imagecontroller_state.dart';

class ImagecontrollerCubit extends Cubit<ImagecontrollerState> {
  ImagecontrollerCubit() : super(ImagecontrollerInitial());
  showImagePicker(ImageSource source) async {
    emit(ImagecontrollerInitial());
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: source);
    if (photo != null) {
      print(photo.path.toString());
      final photoName = photo.path.split("");
      final name = photoName.getRange(61, 70).join();

      emit(ImagecontrollerGetImage(photo.path, name));
    }
  }
}
