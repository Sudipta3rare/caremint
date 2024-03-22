import 'package:caremint/constants/constants.dart';
import 'package:caremint/models/timeslots_model.dart';
import 'package:caremint/services/api_requests.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../constants/app_colors.dart';
import '../ui/pages/single_service_detail/razorpay_api_services.dart';

class ServiceOrderController extends GetxController{
  static ServiceOrderController to = Get.find();


  final  formKey =GlobalKey<FormState>();

  TextEditingController itemNo= TextEditingController();
  // Rx<int> items = 1.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  List<Body> timeslot = <Body>[];

  final Razorpay _razorpay = Razorpay();
  final razorPayKey = dotenv.get("RAZOR_KEY");
  final razorPaySecret = dotenv.get("RAZOR_SECRET");


  @override
  void onInit() {
    super.onInit();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    getTimeslots();

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


  Future<void> getTimeslots() async{
    ApiRequest(url: '${Constant.baseUrl}/api/timeslots', data: null).get(beforeSend: (){}, onSuccess: (data) async {
     timeslot =  await Timeslots.fromJson(data as Map<String, dynamic>).body;
      for (var item in timeslot){
        timings.add(item.slots);
      }
    },
        onError: (onError){
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




String timingSelected ="";
  List<String> timings = [];



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



  Future<void> onCheckout(String sName, String serviceId , String price, String providerId, String timeslotId) async {


print( timings.indexOf(timeslotId)+1);
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
  "vehicle_brand" : vName.text,
  "vehicle_model" : vModel.text,
  "vehicle_no" : vNumber.text,
  "timeslot_id" : (timings.indexOf(timeslotId)+1),
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
   Get.offAllNamed("/homenew");
  },

    onError: (onError){
  print(onError);
  Get.snackbar(
    "Error",
    "Order failed. You provide wrong pin code!",
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