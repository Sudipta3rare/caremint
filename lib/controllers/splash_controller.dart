import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class SplashScreenViewModel extends GetxController
     {
  static SplashScreenViewModel to = Get.find();
  // late AnimationController animationController;
  // late Animation<double> animation;

  // @override
  // void onInit() {
  //   animationInitilization();
  //   super.onInit();
  // }
  late AnimationController controller;
  late Animation<double> animation;
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