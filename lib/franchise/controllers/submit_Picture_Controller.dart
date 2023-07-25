import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SubmitPictureController extends GetxController{
  static SubmitPictureController to = Get.find();
  final ImagePicker picker = ImagePicker();
   List<XFile> imagePathList = [];
  Future<void> pickMultipleImg () async {
    imagePathList = await picker.pickMultiImage(
      requestFullMetadata: false,
      maxHeight: 200,
      maxWidth: 200
    );
  update();
  }
  Future<void> pickCameraImage () async {
   XFile? image = await picker.pickImage(source: ImageSource.camera);
    imagePathList.add(image!);
  update();
  }
}