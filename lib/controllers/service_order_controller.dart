
import 'package:caremint/constants/constants.dart';
import 'package:caremint/services/api_requests.dart';


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../constants/app_colors.dart';

class ServiceOrderController extends GetxController{
  static ServiceOrderController to = Get.find();


  final  formKey =GlobalKey<FormState>();

  TextEditingController itemNo= TextEditingController();
  // Rx<int> items = 1.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;





String timingSelected ="";
  List<String> timings = ["6:00 - 7:00 AM", "7:00 - 8:00 AM","8:00  - 9:00 AM","9:00 - 10:00 AM", "10:00 - 11:00 AM",
                          "11:00 - 12:00 PM", "12:00 - 1:00 PM","1:00 - 2:00 PM",
                          "2:00 - 3:00 PM", "3:00 - 4:00 PM", "4:00 - 5:00 PM",
                          "5:00 - 6:00 PM", "6:00 - 7:00 PM", "7:00 - 8:00 PM"];



  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController des = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController vName = TextEditingController();
  TextEditingController vNumber = TextEditingController();
  TextEditingController vModel = TextEditingController();


  
  Future<void> onCheckout(String sName, String serviceId , String price, String providerId) async {


print( DateFormat("yMd").format(selectedDate.value));
ApiRequest(url: '${Constant.baseUrl}/api/add-cart/${serviceId}', frmData:
{
  "order_price": double.parse(price),
  "provider_id" : providerId,
  "payment_mode" :"COD",
  "delivery_date" : DateFormat("yMd").format(selectedDate.value),
  "name" : name.text,
  "mobile_number" : phone.text,
  "address" : "${address.text}, ${city.text}, ${state.text}",
  "description" : des.text,
  "pincode" : pincode.text,
  // "vName" : vName.text,
  // "vModel" : vModel.text,
  // "vNumber" : vNumber.text,
})
    .postToken(beforeSend: (){},
    onSuccess: (onSuccess){


  Get.back();
  Get.snackbar(
    "Order Placed",
    "Order successful. Check My Orders!",
    snackPosition: SnackPosition
        .BOTTOM,
    colorText: Color(0xffffffff),
    backgroundColor: AppStyle()
        .gradientColor2,
    duration: Duration(seconds: 2),);
    clearFeilds();
    // Get.back();
    // Get.back();
   Get.offAllNamed("/home");
  },

    onError: (onError){
  print(onError);
  Get.snackbar(
    "Error",
    "Order failed. Please try again!",
    snackPosition: SnackPosition
        .BOTTOM,
    colorText: Color(0xffffffff),
    backgroundColor: AppStyle()
        .gradientColor2,
    duration: Duration(seconds: 2),);
    });


}
 void getSnackBar(){
   Get.snackbar("Empty Feild", "All Fields are required",snackPosition: SnackPosition.TOP,
     colorText: Color(0xffffffff),
     backgroundColor: AppStyle().gradientColor2,
     duration: Duration(seconds: 2),);
 }
  void clearFeilds(){
    name.clear();
    pincode.clear();
    des.clear();
    phone.clear();
    address.clear();
    selectedDate.value = DateTime.now();
    city.clear();
    state.clear();
    vName.clear();
    vModel.clear();
    vNumber.clear();
  }
}