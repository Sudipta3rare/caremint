import 'package:caremint/controllers/firebase_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/userDataModel.dart';

/*
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

  List category = [];
  List categoryImage = [];
  List categoryId = [];

  Future<void> getUserData() async {
    isLoggedIn.value = await FirebaseAuth.instance.currentUser != '' || FirebaseAuth.instance.currentUser != null ? true : false;

    if(isLoggedIn.value) {
      var snapshot = await db
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get();
      userDetails = UserDataModel.fromSnapshot(snapshot);
      print(snapshot.id);

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
    category = [];
    categoryImage = [];
  }

  void getCategory() async {
    isLoading.value = true;
    final query = await db.collection('Category').get();

    // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    //   // treasureLocations.add(document.data as Map<String, dynamic>);
    // print(allData);

    for (int i = 0; i < query.docs.length; i++) {
      var a = query.docs[i].data();

      var cat = a["category"] ?? '';
      var catImg = a["category_image"] ?? '';
      categoryId.add(query.docs[i].id);
      categoryImage.add(catImg);
      category.add(cat);
      selectItems.add(cat);
    }

    print(category);
    isLoading.value = false;
  }

  void gotoService(index) {
    Get.toNamed('/service');
  }
}
*/
