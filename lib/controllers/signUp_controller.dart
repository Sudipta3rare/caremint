import 'dart:convert';
import 'dart:ui';

import 'package:caremint/data/api_signup_provider.dart';
import 'package:caremint/models/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../franchise/controllers/customerInfo_controller.dart';
import '../franchise/controllers/listing_services_controller.dart';


class SignUpController extends GetxController {

  List<String> toggleButtonString = ["Provider","Customer"];
  RxInt tabTextIndexSelected = 0.obs;
  RxBool isLoading = false.obs;
  toggle(int index) => tabTextIndexSelected.value = index;
  String dropdownValueCategory= 'Category';
  String dropdownValuePackage= 'Package';
  List<String> listOfCategory = ['Ceramic Coating', 'Deep Cleaning', 'Exterior + Interior Service', 'Exterior Service', 'Interior Service','Monthly Subscription'];
  List<String> listOfPackage = ['Silver','Gold','Platinum','Titanium'];

  var store= GetStorage();


  Future<void> submitForm(String email,String phone, String address, String pincode, String name, String password, String dob) async {
    // print( DateFormat("yMd").format(selectedDate.value))
    Map<String, String> dataMap = {};

    dataMap = {
      "user_firstname": name,
      "user_email": email,
      "user_pass": password,
      "user_pincode": pincode,
      "user_address" : address,
      "user_phonenumber" : phone,
      "dob" : dob,
    };


    await postSignUpForm(json.encode(
      dataMap,
    ));

  }



  Future<void> postSignUpForm(dynamic data) async {

    isLoading.value = true;
    await SignUpProvider().postSignUpRes(
      data: data,
      onSuccess: (val) {

        isLoading.value = false;

        // onRefresh();
        update();
      },
      onError: (error) {
        // print("post Singup");
        print(error);
        isLoading.value = false;
        Get.back();
        // onRefresh();
        update();
      },
    );
  }

  Future<void> goToProvider() async {
    CustomerInfoController cCtrl = CustomerInfoController.to;
    // ListingServicesController sCtrl = ListingServicesController.to;
    cCtrl.isLoading.value= true;
     await cCtrl.getOngoingOrder();
     await cCtrl.getCanceledOrder();
    await cCtrl.getCompletedOrder();
    await cCtrl.getNewOrder();
    cCtrl.isLoading.value = false;
    // sCtrl.getListedCategory();
    update();
    Get.offAllNamed('/tabview');
  }

}