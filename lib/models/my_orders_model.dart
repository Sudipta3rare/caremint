
class MyOrderModel {
  final String ordId;
  final String userId;
  final String address;

  final String city;
  final String date;
  final String description;
  final String payment;
  final String price;
  final String providerId;
  final String sCategory;
  final String sName;
  final String state;
  final String status;
  final String time;

  MyOrderModel({
    this.userId = '',
    this.ordId = '',
    this.address = '',
    this.city = '',
    this.date = '',
    this.description = '',
    this.payment = '',
    this.price = '',
    this.providerId = '',
    this.sCategory = '',
    this.sName = '',
    this.state = '',
    this.status = '',
    this.time = '',});

  toJson() {
    return {
      "userId": userId,
      "id": ordId,
      "city": city,
      "address": address,
      "date": date,
      "description": description,
      "payment": payment,
      "price": price,
      "provider_id": providerId,
      "s_category": sCategory,
      "s_name": sName,
      "state": state,
      "status": status,
      "time": time,
    };
  }

// factory MyOrderModel.fromSnapshot(
//     DocumentSnapshot<Map<String, dynamic>> document){
//   final data = document.data()!;
//   return MyOrderModel(
//
//     ordId: document.id,
//     name: data["name"],
//     phone: data["phone"],
//     city: data["city"],
//     image: data['image'],
//
//     service : List<Service>.from(data["service"].map((x) => Service.fromJson(x))),
//     state: data["state"],
//   );

/* factory MyOrderModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document){
    // print(document.id);
    final data = document.data()!;

    return MyOrderModel(
      ordId: document.id ?? '',
   userId: data["userId"] ?? '',
   address: data["address"] ?? '',
   city: data["city"] ?? '',
   date: data["date"] ?? '',
   description: data["description"] ?? '',
   payment: data["payment"] ?? '',
   providerId: data["providerId"] ?? '',
   price: data["price"]?? '',
   sCategory: data["sCategory"] ?? '',
   sName: data["sName"] ?? '',
   state: data["state"] ?? '' ,
   status: data["status"] == "1" ? "Completed" : "Ongoing" ,
   time: data["time"],
    );
  }
    Map<String, dynamic> toFirestore(Map<String,dynamic> data,  String userId){
    return {
      "userId" : userId ?? '',
      "address": data["address"],
      "city": data["city"],
      "date": data["date"],
      "description": data["description"],
      "payment": data["payment"],
      "providerId": data["provider_id"],
      "price": data["price"].toString(),
      "sCategory": data["category"] ?? '',
      "sName": data["s_name"],
      "state": data["state"]  ,
      "status":"0",
      "time": data["time"],
    };
}
}*/
}
