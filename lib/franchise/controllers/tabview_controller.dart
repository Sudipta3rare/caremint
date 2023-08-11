import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TabviewController extends GetxController{
  static TabviewController to = Get.find();

  var store = GetStorage();
  RxBool isLoading = false.obs;

}