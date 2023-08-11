// To parse this JSON data, do
//
//     final ongoingOrder = ongoingOrderFromJson(jsonString);


class OngoingOrderResponse {
  List<OngoingOrders>? body;

  OngoingOrderResponse({
    this.body,
  });

  factory OngoingOrderResponse.fromJson(Map<String, dynamic> json) => OngoingOrderResponse(
    body: json["body"] == null ? [] : List<OngoingOrders>.from(json["body"]!.map((x) => OngoingOrders.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "body": body == null ? [] : List<dynamic>.from(body!.map((x) => x.toJson())),
  };
}

class OngoingOrders {
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

  OngoingOrders({
    this.id,
    this.serviceId,
    this.providerId,
    this.userId,
    this.name,
    this.mobileNumber,
    this.pincodeId,
    this.address,
    this.orderDate,
    this.orderTime,
    this.orderPrice,
    this.deliveryDate,
    this.orderStatus,
    this.image,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory OngoingOrders.fromJson(Map<String, dynamic> json) => OngoingOrders(
    id: json["id"],
    serviceId: json["service_id"],
    providerId: json["provider_id"],
    userId: json["user_id"],
    name: json["name"],
    mobileNumber: json["mobile_number"],
    pincodeId: json["pincode_id"],
    address: json["address"],
    orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
    orderTime: json["order_time"],
    orderPrice: json["order_price"],
    deliveryDate: json["delivery_date"] == null ? null : DateTime.parse(json["delivery_date"]),
    orderStatus: json["order_status"],
    image: json["image"],
    description: json["description"],
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
    "order_date": "${orderDate!.year.toString().padLeft(4, '0')}-${orderDate!.month.toString().padLeft(2, '0')}-${orderDate!.day.toString().padLeft(2, '0')}",
    "order_time": orderTime,
    "order_price": orderPrice,
    "delivery_date": "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
    "order_status": orderStatus,
    "image": image,
    "description": description,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
