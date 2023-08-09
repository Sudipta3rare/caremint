import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../constants/app_colors.dart';

/*
class ServiceOrderController extends GetxController{
  static ServiceOrderController to = Get.find();


  final  formKey =GlobalKey<FormState>();

  TextEditingController itemNo= TextEditingController();
  // Rx<int> items = 1.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;

  FirebaseFirestore db = FirebaseFirestore.instance;


  List<String> timings = ["8:00 - 8:30 AM","8:30 - 9:00 AM","9:00 - 9:30 AM", "9:30 - 10:00 AM", "10:00 - 10:30 AM", "10:30 -11:00 AM",
                          "11:00 - 11:30 AM", "11:30 - 12:00 PM", "12:00 - 12:30 PM", "12:30 - 1:00 PM","1:00 - 1:30 PM", "1:30 - 2:00 PM",
                          "2:00 - 2:30 PM", "2:30 - 3:00 PM", "3:00 - 3:30 PM", "3:30 - 4:00 PM", "4:00 - 4:30 PM", "4:30 - 5:00 PM",
                          "5:00 - 5:30 PM", "5:30 - 6:00 PM", "6:00 - 6:30 PM", "6:30 - 7:00 PM", "7:00 - 7:30 PM","7:30 - 8:00 PM"];

  String timingSelected= "";

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController des = TextEditingController();
  // TextEditingController pincode = TextEditingController();

  
  Future<void> onCheckout(String sName, String category, int price, String providerId) async {
    var snapshot = await  db
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid);
   snapshot.update({"cart": FieldValue.arrayUnion([{
     "address": address.text,
     "date": DateFormat.yMEd().format(selectedDate.value).toString(),
     "name" : name.text,
     "time" : timingSelected,
     "status" : "in cart",
     "description" : des.text,
     "state": state.text,
     "city" : city.text,
     "s_name" : sName,
     "category": category,
     "price" : price,
     "provider_id": providerId,
     "payment" : "COD",

   }])}).then((value) => print("cart object added"));



}
 void getSnackBar(){
   Get.snackbar("Empty Feild", "All Fields are required",snackPosition: SnackPosition.TOP,
     colorText: Color(0xffffffff),
     backgroundColor: AppStyle().gradientColor2,
     duration: Duration(seconds: 2),);
 }
  void checkFields(){
    // name.text == '' ? getSnackBar() : null;
    // phone.text == '' ? getSnackBar() : null;
    // address.text == '' ? getSnackBar() : null;
    // state.text == '' ? getSnackBar() : null;
    // city.text == '' ? getSnackBar() : null;
    // des.text == '' ? getSnackBar() : null;
  }
}*/
