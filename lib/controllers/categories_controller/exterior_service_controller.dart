import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../models/service_person.dart';

enum ViewType { grid, list }

class ExteriorServiceController extends GetxController{
  static ExteriorServiceController to= Get.find();
  List<IconData> listIconTabToggle = [Icons.grid_view_sharp,Icons.list];
  List<String> listIconLabel =["", ""];
  RxInt tabTextIndexSelected = 0.obs;
  toggle(int index) => tabTextIndexSelected.value = index;

  // final db = FirebaseFirestore.instance;



  int crossAxisCount = 2;

  double aspectRatio = 1.5;

  ViewType viewType = ViewType.grid;

   late List itemList;
  FirebaseFirestore db = FirebaseFirestore.instance;

  String categoryId = '';
  String catName = '';


  RxBool isLoading = true.obs;

  late String city,pincode;


  void getProviders () async {
    isLoading.value = true;

   final querySnapshot=  await db.collection('Category').doc(categoryId).collection("providers").where("pincode", arrayContains: pincode).get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];
      print(a.id);
    }
      itemList = querySnapshot.docs.map((doc) => Providers.fromSnapshot(doc)).toList();
    isLoading.value = false;
    update();
  }


  void getProvidersWithLocation () async {
    isLoading.value = true;
   final querySnapshot=  await db.collection('Category').doc(categoryId).collection("providers").
            where('city', isEqualTo: city).where("pincode", arrayContains: pincode).get();


    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];
      print(a.id);
    }
      itemList = querySnapshot.docs.map((doc) => Providers.fromSnapshot(doc)).toList();

    // print(itemList[0].service[0].price);
    // itemList.add(userLink);
    // print(itemList);
    // print(itemList.length);
    isLoading.value = false;
    update();
  }

  void gotoServiceWithLocation(String catId, String catN, cty, st){
    categoryId = catId;
    catName = catN;
    city =capitalizeAllWord(cty);
    pincode = st;
    // state =capitalizeAllWord(st);
    // print(catId);
    itemList = [];
    getProvidersWithLocation();
    Get.toNamed('/service');
  }

  void gotoService(String catId, String catN, pin){
    categoryId = catId;
    catName = catN;
   pincode = pin;
   // print(pincode);
    // print(catId);
    itemList = [];
    getProviders();
    Get.toNamed('/service');
  }

  String capitalizeAllWord(String value) {
    var result = value[0].toUpperCase();
    for (int i = 1; i < value.length; i++) {
      if (value[i - 1] == " ") {
        result = result + value[i].toUpperCase();
      } else {
        result = result + value[i];
      }
    }
    return result;
  }


}