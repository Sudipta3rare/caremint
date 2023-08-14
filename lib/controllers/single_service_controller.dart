import 'dart:ui';

import 'package:caremint/constants/constants.dart';
import 'package:caremint/models/service_detial.dart';
import 'package:caremint/models/service_person.dart';
import 'package:caremint/services/api_requests.dart';
import 'package:caremint/ui/pages/single_service_detail/service_detail_page.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
class SingleServiceController extends GetxController{
static SingleServiceController to = Get.find();
RxBool isLoading = true.obs;
  // RxInt selectedIndex = 0.obs;
  String providerName = '';
  String providerAddress = "";
  String providerId = "";
  // var  serviceResponse;
  List<Service>  serviceList= [];
  List<Service> searchList=[];
Future<void> getProviderService(String id)async{
  isLoading.value = true;
  // update();

 await ApiRequest(url: Constant.baseUrl+'/api/get-provider-service/${id}', data: null).getToken(beforeSend: (){},
      onSuccess: (onSuccess){

  var   serviceResponse = ServicesResponse.fromJson(onSuccess);
      serviceList.clear();
      serviceList.addAll(serviceResponse.body?.services as Iterable<Service>);

      searchList = serviceList;
      update();
      },
      onError: (onError){
        Get.snackbar(
          'Error',
          'Unable to fetch services. Please try again!',
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
//   List<Provider> itemList=[];
//   List<Service> serviceDetialsList=[];
//
//   late Providers personDetails;

  Future<void> gotoServieDetail(Provider personDetail) async {
    providerName = personDetail.displayName.toString();
    providerAddress = personDetail.userAddress.toString();
    providerId = personDetail.userId.toString();
    print(providerId)
;   getProviderService(personDetail.userId!);
   Get.to(SingleServiceDetail());

   
  }













//
// void onInit() async{
//   getProviders();
// }

// void getProviders () async {
//
//   final querySnapshot=  await db.collection('Category').doc("exterior_service").collection("providers").get();
//   for (int i = 0; i < querySnapshot.docs.length; i++) {
//     var a = querySnapshot.docs[i];
//     print(a.id);
//   }
//   itemList = querySnapshot.docs.map((doc) => Providers.fromSnapshot(doc)).toList();
//   print(itemList[0].service);
//   for( var i in itemList[0].service ){
//     serviceDetialsList.add(i);
//   }
//   print(serviceDetialsList);
//   // itemList.add(userLink);
//   // print(itemList);
//   // print(itemList.length);
// }
}