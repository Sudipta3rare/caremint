import 'dart:ui';

import 'package:caremint/constants/constants.dart';
import 'package:caremint/services/api_requests.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../constants/app_colors.dart';
import '../../models/my_orders_model.dart';
import '../../ui/pages/single_service_detail/razorpay_api_services.dart';

class MyOrderController extends GetxController{
  static MyOrderController to = Get.find();

  double rating = 0.0;
  TextEditingController review = TextEditingController();
  List<MyOrders> myOrderList = [];
      List<Map<String, dynamic>> cartList = [];
      Map<String, dynamic> cartItem = {};
  RxBool isLoading = true.obs;

  final Razorpay _razorpay = Razorpay();
  final razorPayKey = dotenv.get("RAZOR_KEY");
  final razorPaySecret = dotenv.get("RAZOR_SECRET");


  @override
  void onInit() {
    super.onInit();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }


  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Get.snackbar(
      'Message',
      'Payment Successful',
      snackPosition: SnackPosition.BOTTOM,
      colorText: AppStyle().gradientColor4,
      backgroundColor: AppStyle().gradientColor1,
      duration: Duration(seconds: 2),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.snackbar(
      'Message',
      'Payment Unsuccessful',
      snackPosition: SnackPosition.BOTTOM,
      colorText: AppStyle().gradientColor4 ,
      backgroundColor: AppStyle().gradientColor1,
      duration: Duration(seconds: 2),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  openSession({required num amount}) {
    createOrder(amount: amount).then((orderId) {
      print(orderId);
      if (orderId.toString().isNotEmpty) {
        var options = {
          'key': razorPayKey, //Razor pay API Key
          'amount': amount, //in the smallest currency sub-unit.
          'name': 'Caremint',
          'order_id': orderId, // Generate order_id using Orders API
          'description': 'Description for order', //Order Description to be shown in razor pay page
          'timeout': 60, // in seconds
          /* 'prefill': {
            'contact': '1234567890',
            'email': 'example@gmail.com'
          } //contact number and email id of user*/
        };
        _razorpay.open(options);
      } else {}
    });
  }

  createOrder({
    required num amount,
  }) async {
    final myData = await RazorpayApiServices().razorPayApi(amount, "rcp_id_1");
    if (myData["status"] == "success") {
      print(myData);
      return myData["body"]["id"];
    } else {
      return "";
    }
  }


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

  Future<void> postReview(int index) async {
    isLoading.value = true;
    update();
    ApiRequest(url: '${Constant.baseUrl}/api/review', frmData: {
      'rating' : rating,
      'review' : review.text,
      'order_id': myOrderList[index].id,


    }).postToken(beforeSend: (){}, onSuccess: (data){
      print(data);
      rating = 0.0;
      review.clear();

      Get.snackbar(
        'Success',
        'Review placed successfully',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Color(0xffffffff),
        backgroundColor: AppStyle().gradientColor2,
        duration: Duration(seconds: 2),
      );
      update();

    }, onError: (onError){
      Get.snackbar(
        'Error',
        'Unable to review order. Please try again!',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Color(0xffffffff),
        backgroundColor: AppStyle().gradientColor2,
        duration: Duration(seconds: 2),
      );
    });
    isLoading.value = false;
    update();
    Get.offAllNamed('/homenew');

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