import 'dart:ui';

import 'package:caremint/constants/constants.dart';
import 'package:caremint/franchise/models/ongoingOrderModel.dart';
import 'package:caremint/services/api_requests.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants/app_colors.dart';
import '../models/customer_info.dart';

class CustomerInfoController extends GetxController{
   static CustomerInfoController to = Get.find();

  List<OngoingOrders> ongoingOrderList = [];
  List<OngoingOrders> completedOrderList = [];
  List<OngoingOrders> newOrderList = [];
  RxBool isLoading = false.obs;


 Future<void> onRefresh()async{
  isLoading.value= true;
  await  getOngoingOrder();
  await getCompletedOrder();
  await getNewOrder();
  isLoading.value = false;
  update();
 }
   Future<void> getOngoingOrder() async {
     isLoading.value = true;
    ApiRequest(url: Constant.baseUrl+'/api/get-pending-orders', data: null).getToken(
        beforeSend: (){}, onSuccess: (onSuccess) {

          var ongoingOrderResponse = OngoingOrderResponse.fromJson(onSuccess as Map<String, dynamic>);
          ongoingOrderList.clear();
          ongoingOrderList.addAll(ongoingOrderResponse.body as Iterable<OngoingOrders>);

          isLoading.value = false;
          update();

    }, onError: (onError){
          isLoading.value = false;
          print(onError);
          update();
    });
     isLoading.value = false;
    update();
   }

   Future<void> getCompletedOrder() async {
     isLoading.value = true;
    ApiRequest(url: Constant.baseUrl+'/api/get-completed-orders', data: null).getToken(
        beforeSend: (){}, onSuccess: (onSuccess) {

          var completedOrderListResponse = OngoingOrderResponse.fromJson(onSuccess as Map<String, dynamic>);
          completedOrderList.clear();
          completedOrderList.addAll(completedOrderListResponse.body as Iterable<OngoingOrders>);

          isLoading.value = false;
          update();
    }, onError: (onError){
          isLoading.value = false;
          print(onError);
          update();
    });
     isLoading.value = false;
    update();
   }

   Future<void> getNewOrder() async {
     isLoading.value = true;
    ApiRequest(url: Constant.baseUrl+'/api/get-new-orders', data: null).getToken(
        beforeSend: (){}, onSuccess: (onSuccess) {

          var newOrderListResponse = OngoingOrderResponse.fromJson(onSuccess as Map<String, dynamic>);
          newOrderList.clear();
          newOrderList.addAll(newOrderListResponse.body as Iterable<OngoingOrders>);

          isLoading.value = false;
          update();
    }, onError: (onError){
          isLoading.value = false;
          print(onError);
          update();
    });
     isLoading.value = false;
    update();
   }


   Future<void> postAcceptOrder(OngoingOrders order) async{
     isLoading.value = true;
   ApiRequest(url: '${Constant.baseUrl}api/order-accept/', frmData: {order.id}).postToken(beforeSend:
   (){},
       onSuccess: (onSuccess) async {

      await onRefresh().whenComplete(() => isLoading.value=false);
      update();
       },
       onError: (onError){
     print(onError);
     Get.snackbar(
       'Error',
       'Unable to accept order. Please try again!',
       snackPosition: SnackPosition.BOTTOM,
       colorText: Color(0xffffffff),
       backgroundColor: AppStyle().gradientColor2,
       duration: Duration(seconds: 2),
     );
     isLoading.value= false;
     update();
       });
     isLoading.value= false;
     update();
   }


   Future<void> postCancelOrder(OngoingOrders order) async{
     isLoading.value = true;
   ApiRequest(url: Constant.baseUrl+'api/cancel-order/', frmData: {order.id}).postToken(beforeSend:
   (){},
       onSuccess: (onSuccess) async {
      await onRefresh().whenComplete(() => isLoading.value=false);
      update();
       },
       onError: (onError){
     print(onError);
     Get.snackbar(
       'Error',
       'Unable to cancel order. Please try again!',
       snackPosition: SnackPosition.BOTTOM,
       colorText: Color(0xffffffff),
       backgroundColor: AppStyle().gradientColor2,
       duration: Duration(seconds: 2),
     );
     isLoading.value= false;
     update();
       });
     isLoading.value= false;
     update();
   }
}