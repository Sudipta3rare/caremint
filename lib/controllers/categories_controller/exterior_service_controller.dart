import 'package:caremint/constants/constants.dart';
import 'package:caremint/services/api_requests.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
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

   late List<Provider> itemList;

  String categoryId = '';
  String catName = '';


  RxBool isLoading = true.obs;

  late String city,pincode;
///

  Future<void> getProviders () async {
    isLoading.value = true;


    ApiRequest(url: Constant.baseUrl+"/api/get-providers/${2}/${700054}", data: null).getToken(beforeSend: (){},
        onSuccess: (onSuccess){
        var providerResponse = ProviderResponse.fromJson(onSuccess);
      itemList.addAll(providerResponse.body as Iterable<Provider>);
      print(itemList[0].displayName);
      update();
        },
        onError: (onError){
          Get.snackbar(
            'Error',
            'Unable to fetch provider. Please try again!',
            snackPosition: SnackPosition.BOTTOM,
            colorText: Color(0xffffffff),
            backgroundColor: AppStyle().gradientColor2,
            duration: Duration(seconds: 2),
          );
        });


    isLoading.value = false;
    update();
  }

  //
  // void getProvidersWithLocation () async {
  //   isLoading.value = true;
  //  final querySnapshot=  await db.collection('Category').doc(categoryId).collection("providers").
  //           where('city', isEqualTo: city).where("pincode", arrayContains: pincode).get();
  //
  //
  //   for (int i = 0; i < querySnapshot.docs.length; i++) {
  //     var a = querySnapshot.docs[i];
  //     print(a.id);
  //   }
  //     // itemList = querySnapshot.docs.map((doc) => Providers.fromSnapshot(doc)).toList();
  //
  //   // print(itemList[0].service[0].price);
  //   // itemList.add(userLink);
  //   // print(itemList);
  //   // print(itemList.length);
  //   isLoading.value = false;
  //   update();
  // }
  //
  // Future<void> gotoServiceWithLocation() async {
  //   // categoryId = catId;
  //   // catName = catN;
  //   // city =capitalizeAllWord(cty).trim();
  //   // pincode = st.trim();
  //   // // state =capitalizeAllWord(st);
  //   // // print(catId);
  //   // itemList = [];
  //  await getProviders();
  //   Get.toNamed('/service');
  // }

  Future<void> gotoService(String catId, String catN, pin) async {
    categoryId = catId;
    catName = catN;
   pincode = pin.trim();
   // print(pincode);
    // print(catId);
    itemList = [];
   await  getProviders().whenComplete(() =>   Get.toNamed('/service'));
  
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