import 'package:cloud_firestore/cloud_firestore.dart';

class Providers {
  final String id;
  final String city;
  final String phone;
  final List<Service> service;
  final String name;
  final String state;
  final String image;

  Providers({
    this.id = '',
    required this.city,
    required this.phone,
    required this.service,
    required this.name,
    required this.state,
    this.image ='',
  });

  toJson() {
    return {

      "name": name,
      "city": city,
      "phone": phone,
      "service": service,
      "state": state,
      "image" : image
    };
  }

  factory Providers.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return Providers(
      id: document.id,
      name: data["name"],
      phone: data["phone"],
      city: data["city"],
      image: data['image'],

      service : List<Service>.from(data["service"].map((x) => Service.fromJson(x))),
      state: data["state"],
    );
  }


}




class Service {
  final int price;
  final String sName;
  final String sCategory;
  late final int quantity;
  final String sImage;

  Service({
    required this.price,
    required this.sName,
    required this.sCategory,
    this.quantity = 0,
    this.sImage  = '',
  });
//
  factory Service.fromJson(Map<String, dynamic> json) => Service(
    price: json["price"],
    sName: json["s_name"],
    sCategory: json["s_category"],
    quantity: 0,
    sImage: json["s_image"],
  );


  // factory Service.fromSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> document){
  //   final data = document.data()!;
  //   return Providers(
  //
  //   );
  // }

  Map<String, dynamic> toJson() => {
    "quantity" : 0,
    "price": price,
    "s_name": sName,
    "s_category": sCategory,
    "s_image" :  sImage,

  };
}
