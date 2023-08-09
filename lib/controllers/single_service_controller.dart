import 'package:caremint/models/service_person.dart';
import 'package:caremint/ui/pages/single_service_detail/service_detail_page.dart';
import 'package:get/get.dart';
class SingleServiceController extends GetxController{
static SingleServiceController to =Get.find();
  RxInt selectedIndex = 0.obs;


List<Service> searchList=[];

  List<Providers> itemList=[];
  List<Service> serviceDetialsList=[];

  late Providers personDetails;

  void gotoServieDetail(Providers personDetail){
    serviceDetialsList = [];
    personDetails = personDetail;
    serviceDetialsList = personDetail.service;
    searchList = serviceDetialsList;

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