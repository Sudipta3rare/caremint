import 'package:caremint/controllers/firebase_controller.dart';
import 'package:caremint/data/api_category_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:core';

import 'package:caremint/models/category_model.dart';
import 'package:get_storage/get_storage.dart';

import '../models/userDataModel.dart';

class HomeController extends GetxController {
  static HomeController to = Get.find();

  FirebaseController frCtrl = FirebaseController.to;
  FirebaseFirestore db = FirebaseFirestore.instance;

  String currentItem = 'Category';
  List<String> selectItems = ["Category"];

  RxBool isLoading = false.obs;

  RxBool isLoggedIn =
      false.obs;

  UserDataModel userDetails = UserDataModel();

  TextEditingController city = TextEditingController();
  TextEditingController pincode = TextEditingController();


  List<Category> categoryList = [];


  List categoryId = [];

  Future<void> getUserData() async {
    isLoggedIn.value = await FirebaseAuth.instance.currentUser != '' || FirebaseAuth.instance.currentUser != null ? true : false;

    if(isLoggedIn.value) {
      var snapshot = await db
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get();
      userDetails = UserDataModel.fromSnapshot(snapshot);
    }
    update();
  }

  String showName(UserDataModel user) {
    user.firstName == '' ? isLoggedIn.value = false : isLoggedIn.value = true;
    return user.firstName;
  }

  @override
  void onInit() async {
    super.onInit();
    isLoggedIn = await FirebaseAuth.instance.currentUser != '' || FirebaseAuth.instance.currentUser != null ? true.obs : false.obs;
    getCategory();
    getUserData();
  }

  @override
  void onClose() {
    userDetails = UserDataModel();
    categoryId = [];
    categoryList=[];
  }

  void getCategory() async {
    isLoading.value = true;
    CategoryProvider().getCategory(onSuccess: (categoryItems){
      if(categoryItems.body != ''){
        categoryList.clear();

        categoryList.addAll(categoryItems.body as Iterable<Category>);
        print(categoryList[0].categoryName);
      }
    },
        onError: (error){
          categoryList.clear();
          isLoading.value = false;
          update();
        });


    final query = await db.collection('Category').get();


    for (int i = 0; i < query.docs.length; i++) {

      categoryId.add(query.docs[i].id);

    }

    // print(category);
    isLoading.value = false;
  }

  void gotoService(index) {
    Get.toNamed('/service');
  }
}
