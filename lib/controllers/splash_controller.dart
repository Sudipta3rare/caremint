import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreenViewModel extends GetxController
     {
  static SplashScreenViewModel to = Get.find();
  // late AnimationController animationController;
  // late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();
  }

  var store = GetStorage();

  late AnimationController controller;
  late Animation<double> animation;

  bool checkProvider () {
    String  isProvider = (store.read("user_role")) ?? "2";
    print(isProvider);
    if( (isProvider) == "3"){
      return true;
    }
    else {
      return false;
    }
  }


  // animationInitilization() {
  //   animationController =
  //       AnimationController(vsync: this, duration: const Duration(seconds: 2));
  //   animation =
  //       CurvedAnimation(parent: animationController, curve: Curves.easeOut)
  //           .obs
  //           .value;
  //   animation.addListener(() => update());
  //   animationController.forward();
  // }
}