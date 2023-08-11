// import 'package:caremint/franchise/models/listing_service_model.dart';
// import 'package:get/get.dart';
//
// import '../../constants/constants.dart';
// import '../../services/api_requests.dart';
// class ListingServicesController extends GetxController{
//  static ListingServicesController to = Get.find();
//
//   RxBool isLoading = false.obs;
//   List<ListedCategory> listService = [];
//
//
//
//
//   Future<void> getListedCategory() async{
//    isLoading.value = true;
//    ApiRequest(url: Constant.baseUrl+'/api/get-provider-category', data: null).getToken(
//        beforeSend: (){}, onSuccess: (onSuccess) {
//
//     var listedServiceResponse = ListedServicesResponse.fromJson(onSuccess as Map<String, dynamic>);
//     listService.clear();
//     listService.addAll(listedServiceResponse.body?[0].categories as Iterable<ListedCategory>);
//     isLoading.value = false;
//    }, onError: (onError){
//     isLoading.value = false;
//     print(onError);
//    });
//    update();
//
//   }
// }