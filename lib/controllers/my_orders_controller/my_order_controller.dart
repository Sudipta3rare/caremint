import 'dart:ui';

import 'package:caremint/constants/constants.dart';
import 'package:caremint/services/api_requests.dart';

import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../models/my_orders_model.dart';

class MyOrderController extends GetxController{
  static MyOrderController to = Get.find();

  // void onInit(){
  //   super.onInit();
  //   getUserOrders();
  // }

  List<MyOrders> myOrderList = [];
      List<Map<String, dynamic>> cartList = [];
      Map<String, dynamic> cartItem = {};

  RxBool isLoading = true.obs;


  Future<void> getUserOrders() async {
  isLoading.value = true;
  update();


  ApiRequest(url: Constant.baseUrl+"/api/get-user-orders", data: null).getToken(beforeSend: (){},
      onSuccess: (onSuccess){
    var myOrderResponse = MyOrdersResponse.fromJson(onSuccess);
    myOrderList.clear();
    myOrderList.addAll(myOrderResponse.body!);
    update();
      },
      onError: (onError){
    print(onError);
        Get.snackbar(
          'Error',
          'Unable to fetch orders. Please try again!',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Color(0xffffffff),
          backgroundColor: AppStyle().gradientColor2,
          duration: Duration(seconds: 2),
        );
      });

    isLoading.value = false;
    update();
  }

  Future<void> postUserOrder() async {

    cartList=[];
    cartItem = {};

  }

   Future<void> gotoMyOrders() async {
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
}