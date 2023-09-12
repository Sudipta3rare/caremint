// To parse this JSON data, do
//
//     final myOrdersResponse = myOrdersResponseFromJson(jsonString);


class MyOrdersResponse {
  List<MyOrders>? body;

  MyOrdersResponse({
    this.body,
  });

  factory MyOrdersResponse.fromJson(Map<String, dynamic> json) => MyOrdersResponse(
    body: json["body"] == null ? [] : List<MyOrders>.from(json["body"]!.map((x) => MyOrders.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "body": body == null ? [] : List<dynamic>.from(body!.map((x) => x.toJson())),
  };
}

class MyOrders {
  int? id;
  String? serviceId;
  String? providerId;
  String? userId;
  String? name;
  String? mobileNumber;
  String? pincodeId;
  String? address;
  DateTime? orderDate;
  String? orderTime;
  String? orderPrice;
  DateTime? deliveryDate;
  String? orderStatus;
  String? image;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? review;
  String? rating;
  String? vehicleBrand;
  String? vehicleModel;
  String? vehicleNo;
  String? timeslotId;


  MyOrders({
    this.id,
    this.serviceId,
    this.providerId,
    this.userId,
    this.name = "",
    this.mobileNumber = "",
    this.pincodeId,
    this.address = "",
    this.orderDate ,
    this.orderTime,
    this.orderPrice = "",
    this.deliveryDate,
    this.orderStatus = "",
    this.image = "",
    this.description = "",
    this.review,
     this.rating,
     this.vehicleBrand,
     this.vehicleModel,
     this.vehicleNo,
     this.timeslotId,
    this.createdAt,
    this.updatedAt,
  });

  factory MyOrders.fromJson(Map<String, dynamic> json) => MyOrders(
    id: json["id"],
    serviceId: json["service_id"],
    providerId: json["provider_id"],
    userId: json["user_id"],
    name:json["name"],
    mobileNumber: json["mobile_number"],
    pincodeId: json["pincode_id"],
    address: json["address"],
    orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
    orderTime: json["order_time"] ,
    orderPrice: json["order_price"] == null ? "" : json["order_price"],
    deliveryDate: json["delivery_date"] == null ? null : DateTime.parse(json["delivery_date"]),
    orderStatus: json["order_status"],
    image: json["image"],
    description: json["description"],
    review: json["review"]  ?? "",
    rating: json["rating"] ?? "",
    vehicleBrand: json["vehicle_brand"]  ?? "",
    vehicleModel: json["vehicle_model"]  ?? "",
    vehicleNo: json["vehicle_no"]  ?? "",
    timeslotId: json["timeslot_id"] ?? "",
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "service_id": serviceId,
    "provider_id": providerId,
    "user_id": userId,
    "name": name,
    "mobile_number": mobileNumber,
    "pincode_id": pincodeId,
    "address": address,
    "order_date": orderDate?.toString(),
    "order_time": orderTime?.toString(),
    "order_price": orderPrice ?? "",
    "delivery_date": deliveryDate?.toString(),
    "order_status": orderStatus ?? "",
    "image": image,
    "description": description ?? "",
    "review": review  ?? "",
    "rating": rating  ?? "",
    "vehicle_brand": vehicleBrand  ?? "",
    "vehicle_model": vehicleModel  ?? "",
    "vehicle_no": vehicleNo  ?? "",
    "timeslot_id": timeslotId  ?? "",
    "created_at": createdAt?.toString(),
    "updated_at": updatedAt?.toString(),
  };
}





