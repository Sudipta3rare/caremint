import 'package:caremint/controllers/firebase_controller.dart';
import 'package:caremint/data/api_category_provider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:core';

import 'package:caremint/models/category_model.dart';
import 'package:get_storage/get_storage.dart';

import '../models/userDataModel.dart';
import '../models/user_model.dart';

class HomeController extends GetxController {
  static HomeController to = Get.find();

  var store = GetStorage();
 late  String token ;
  String currentItem = 'Category';
  List<String> selectItems = ["Category"];

  RxBool isLoading = false.obs;

  RxBool isLoggedIn = false.obs;
  RxBool isProvider = false.obs;
  UserDataModel userDetails = UserDataModel();

  TextEditingController city = TextEditingController();
  TextEditingController pincode = TextEditingController();


  List<Category> categoryList = [];


  List categoryId = [];


  Future<void> getUserData() async {

    token =  store.read("user_token") ?? "";
    isLoggedIn.value = token != "" ? true : false;
    print(token);
    if(isLoggedIn.value) {
      userDetails.firstName = store.read("user_name") ?? "";
     userDetails.email = store.read("user_email") ?? "";
     userDetails.pincode=  store.read("user_pincode") ?? "";
     userDetails.roleId = store.read("user_role") ?? "";
     userDetails.phone = store.read("user_phone") ?? "";
    }
    update();
  }
  Future<void> storeUserDetails(UserResponse userResponse) async {
    store.write("user_token", userResponse.token);
    store.write("user_name", userResponse.user?.userFirstname);
    store.write("user_email", userResponse.user?.userEmail);
    store.write("user_pincode", userResponse.user?.userPincode);
    store.write("user_role", userResponse.user?.roleId);
    store.write("user_phone", userResponse.user?.userPhonenumber);
    print(store.read("user_token"));
    isLoggedIn.value = true;
    print(store.read("user_token"));
    print(store.read("user_role"));
    await getUserData();
    update();
  }

  String showName(UserDataModel user) {
    user.firstName == '' ? isLoggedIn.value = false : isLoggedIn.value = true;
    // update();
    return user.firstName;
  }

  @override
  void onInit() async {
    super.onInit();


    getCategory();
    await getUserData();
    // Call update here if necessary
  }

  @override
  void onClose() {
    userDetails = UserDataModel();

    categoryList=[];
  }

  void getCategory() async {
    isLoading.value = true;
    CategoryProvider().getCategory
      (onSuccess: (categoryItems){
      if(categoryItems.body != ''){
        categoryList.clear();
        categoryList.addAll(categoryItems.body as Iterable<Category>);
        for (var items in categoryList)
        {
          categoryId.add(items.id);
          selectItems.add(items.categoryName.toString());
        }
        print(categoryList[0].categoryName);
      }
    },
        onError: (error){
          categoryList.clear();

        });
    isLoading.value = false;
    update();
  }


}
