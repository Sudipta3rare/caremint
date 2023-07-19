import 'package:caremint/models/service_person.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


class CartController extends GetxController {
  static CartController to = Get.find();

  RxBool isLoading = false.obs;


  RxList<Service> cartProducts = <Service>[].obs;
  RxDouble totalPrice = 0.00.obs;


  FirebaseFirestore db = FirebaseFirestore.instance;
  var userId = FirebaseAuth.instance.currentUser?.uid ?? '';
   List cartList = [];

  Future<bool> isLoggedIn() async {
    userId = await FirebaseAuth.instance.currentUser?.uid ?? '';
    print(userId);
    if(userId == ''){
      return false;
    }
    else{
      return true;
    }
  }

  Future<void> decreaseItemQuantity(int index) async {
    // product.quantity--;

    var snapshot = await  db
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    snapshot.update({"cart": FieldValue.arrayRemove([cartList[index]])});
    getCartItems();
  }

  Future<void> removeAll() async {
    var snapshot = await  db
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    snapshot.update({"cart": FieldValue.arrayRemove(cartList)});
    cartList = [];
      update();
  }

  bool get isEmptyCart => cartList.isEmpty;

  // bool isPriceOff(Product product) => product.off != null;

  void calculateTotalPrice() {
    totalPrice.value = 0.00;
    for (var element in cartList) {
      totalPrice.value +=  element["price"];

      // if (isPriceOff(element)) {
      //   totalPrice.value += element.quantity * element.off!;
      // } else {
      //   totalPrice.value += element.quantity * element.price;
      // }
      update();
    }
  }



  Future<void> getCartItems() async {
      isLoading.value = true;
      var snapshot = await db
          .collection('users')
          .doc(userId)
          .get();
      final data = snapshot.data();
      print(data?["cart"]);
      cartList = data?["cart"];

      update();
      calculateTotalPrice();
      isLoading.value = false;
      Get.back();
       Get.toNamed('/cart');
  }







  void gotoCartPage(){
    getCartItems();

  }
}




class CartModel {
  String address ;
  final String city;
  final String date;
  final String description;
  final String name;
  final String price;
  final String providerId;
  final String sCategory;
  final String sName;
  final String state;
  final String status;
  final String time;

  CartModel({
    this.address='',
    this.city='',
    this.date='',
    this.description='',
    this.name='',
    this.price='',
    this.providerId='',
    this.sCategory='',
    this.sName='',
    this.state='',
    this.status ='',
    this.time ='',});
}
