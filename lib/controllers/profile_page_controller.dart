import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfilePageController extends GetxController {
  static ProfilePageController to = Get.find();

  var store = GetStorage();
  late  String token ;
  /*@override
  void onInit() {
    super.onInit();
  }*/

}