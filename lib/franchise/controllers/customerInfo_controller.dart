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
  List<OngoingOrders> canceledOrderList = [];
  RxBool isLoading = true.obs;


 Future<void> onRefresh()async{
  // isLoading.value= true;
  print("refresing");
  await getOngoingOrder();
  await getCompletedOrder();
  await getNewOrder();
  await getCanceledOrder();
  // isLoading.value = false;
  // update();
 }
   Future<void> getOngoingOrder() async {
     ongoingOrderList.clear();

     update();
     isLoading.value = true;
    ApiRequest(url: Constant.baseUrl+'/api/get-pending-orders', data: null).getToken(
        beforeSend: (){}, onSuccess: (onSuccess) {

          var ongoingOrderResponse = OngoingOrderResponse.fromJson(onSuccess as Map<String, dynamic>);
          ongoingOrderList.addAll(ongoingOrderResponse.body as Iterable<OngoingOrders>);
          // isLoading.value = false;
          update();

    }, onError: (onError){
          // isLoading.value = false;
          print("getPending order");
          print(onError);
          // update();
    });
     isLoading.value = false;
    update();
   }
   Future<void> getCanceledOrder() async {
     canceledOrderList.clear();

     update();
     isLoading.value = true;
    ApiRequest(url: Constant.baseUrl+'/api/get-cancelled-orders', data: null).getToken(
        beforeSend: (){}, onSuccess: (onSuccess) {

          var canceledOrder = OngoingOrderResponse.fromJson(onSuccess as Map<String, dynamic>);

          canceledOrderList.addAll(canceledOrder.body as Iterable<OngoingOrders>);

          // isLoading.value = false;
          update();

    }, onError: (onError){
          // isLoading.value = false;
          print("get canceled order");
          print(onError);
          // update();
    });
     isLoading.value = false;
    update();
   }

   Future<void> getCompletedOrder() async {
     completedOrderList.clear();

     update();
     isLoading.value = true;
    ApiRequest(url: Constant.baseUrl+'/api/get-completed-orders', data: null).getToken(
        beforeSend: (){}, onSuccess: (onSuccess) {

          var completedOrderListResponse = OngoingOrderResponse.fromJson(onSuccess as Map<String, dynamic>);

          completedOrderList.addAll(completedOrderListResponse.body as Iterable<OngoingOrders>);

          // isLoading.value = false;
          update();
    }, onError: (onError){
          // isLoading.value = false;
          print("completed order");
          print(onError);
          // update();
    });
     isLoading.value = false;
     update();
   }

   Future<void> getNewOrder() async {
     newOrderList.clear();
     update();
     isLoading.value = true;
     update();
    ApiRequest(url: Constant.baseUrl+'/api/get-new-orders', data: null).getToken(
        beforeSend: (){}, onSuccess: (onSuccess) {

          var newOrderListResponse = OngoingOrderResponse.fromJson(onSuccess as Map<String, dynamic>);

          newOrderList.addAll(newOrderListResponse.body as Iterable<OngoingOrders>);
update();

    }, onError: (onError){
          // isLoading.value = false;
          print("get new order");
          print(onError);
          // update();
    });
     isLoading.value = false;
    update();
   }


   Future<void> postAcceptOrder(OngoingOrders order) async{
     isLoading.value = true;
     update();
     print(isLoading.value);
     print('${Constant.baseUrl}/api/order-accept/${order.id}');
   ApiRequest(url: '${Constant.baseUrl}/api/order-accept/${order.id}', data: null).getToken( beforeSend:
   (){},
       onSuccess: (onSuccess) async {

      await onRefresh().whenComplete(() => isLoading.value=false);
      update();
       },
       onError: (onError) async {
         await onRefresh().whenComplete(() => isLoading.value=false);
         print("order accept");
     print(onError);
     Get.snackbar(
       'Error',
       'Unable to accept order. Please try again!',
       snackPosition: SnackPosition.BOTTOM,
       colorText: Color(0xffffffff),
       backgroundColor: AppStyle().gradientColor2,
       duration: Duration(seconds: 2),
     );
     // isLoading.value= false;
     // update();
       });

     print(isLoading.value);
     update();
   }


   Future<void> postCancelOrder(OngoingOrders order) async{
     isLoading.value = true;
     print(Constant.baseUrl+'/api/cancel-order/${order.id}');
     print(order.id);
   ApiRequest(url: Constant.baseUrl+'/api/cancel-order/${order.id}', data: null).getToken(beforeSend:
   (){},
       onSuccess: (onSuccess) async {
      await onRefresh().whenComplete(() => isLoading.value=false);
      // update();
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
     // isLoading.value= false;
     // update();
       });
     isLoading.value= false;

     update();
   }
}