import 'package:caremint/franchise/controllers/customerInfo_controller.dart';
import 'package:caremint/franchise/controllers/listing_services_controller.dart';
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

    Future<void> goToProvider() async {
      CustomerInfoController cCtrl = CustomerInfoController.to;
      // ListingServicesController sCtrl = ListingServicesController.to;
      await cCtrl.getOngoingOrder();
     await cCtrl.getCompletedOrder();
     await cCtrl.getNewOrder();
      // sCtrl.getListedCategory();
      Get.offAllNamed('/tabview');
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