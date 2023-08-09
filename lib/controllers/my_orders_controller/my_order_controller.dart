import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../models/my_orders_model.dart';

/*
class MyOrderController extends GetxController{
  static MyOrderController to = Get.find();

  // void onInit(){
  //   super.onInit();
  //   getUserOrders();
  // }

  FirebaseFirestore db = FirebaseFirestore.instance;
  List<MyOrderModel> myOrderList = [];
      List<Map<String, dynamic>> cartList = [];
      Map<String, dynamic> cartItem = {};

  RxBool isLoading = false.obs;

  Future<void> getUserOrders() async {
    isLoading.value = true;
    final  userId = await FirebaseAuth.instance.currentUser!.uid.toString();
    // print(userId);
    final querySnapshot=  await db.collection('users').doc(userId).collection("orders").get();
    // for (int i = 0; i < querySnapshot.docs.length; i++) {
    //   var a = querySnapshot.docs[i];
    //   print(a.id);
    // }

    myOrderList = querySnapshot.docs.map((doc) => MyOrderModel.fromSnapshot(doc)).toList();
    // print(myOrderList.length);

    // print(myOrderList[0].sName);
    isLoading.value = false;
    update();
  }

  Future<void> postUserOrder() async {

    final  userId = await FirebaseAuth.instance.currentUser!.uid.toString();

    for(var element in cartList){

      Map<String,dynamic> x = MyOrderModel().toFirestore(element, userId);

      db.collection('users').doc(userId).collection("orders").add(

            x

      ).then((value) => Get.snackbar("Order Placed", "Your Order is placed successfully",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: AppStyle().gradientColor2,
        duration: Duration(seconds: 2)),);
    }
    cartList=[];
    cartItem = {};

  }

   void gotoMyOrders(){
    getUserOrders();
    Get.toNamed("/order");
   }


   void addToOrderList( cartitem){
    cartItem = cartitem;
   cartList.add(cartItem);
   cartItem = {};
   }


   void gotoMyOrdersFromCart(){
     postUserOrder();
     getUserOrders();
     Get.back();
     Get.offAndToNamed("/order");
   }
}*/
