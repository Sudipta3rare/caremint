// To parse this JSON data, do
//
//     final servicesResponse = servicesResponseFromJson(jsonString);

import 'dart:convert';

ServicesResponse servicesResponseFromJson(String str) => ServicesResponse.fromJson(json.decode(str));

String servicesResponseToJson(ServicesResponse data) => json.encode(data.toJson());

class ServicesResponse {
  ServicesResponseBody? body;

  ServicesResponse({
    this.body,
  });

  factory ServicesResponse.fromJson(Map<String, dynamic> json) => ServicesResponse(
    body: json["body"] == null ? null : ServicesResponseBody.fromJson(json["body"]),
  );

  Map<String, dynamic> toJson() => {
    "body": body?.toJson(),
  };
}

class ServicesResponseBody {
  int? id;
  String? userLogin;
  String? userPass;
  String? userEmail;
  dynamic userUrl;
  DateTime? userRegistered;
  dynamic userActivationKey;
  String? userStatus;
  String? displayName;
  String? roleId;
  String? userFirstname;
  String? userPhonenumber;
  String? userPincode;
  String? userAddress;
  dynamic userIsloggedin;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Service>? services;

  ServicesResponseBody({
    this.id,
    this.userLogin,
    this.userPass,
    this.userEmail,
    this.userUrl,
    this.userRegistered,
    this.userActivationKey,
    this.userStatus,
    this.displayName,
    this.roleId,
    this.userFirstname,
    this.userPhonenumber,
    this.userPincode,
    this.userAddress,
    this.userIsloggedin,
    this.createdAt,
    this.updatedAt,
    this.services,
  });

  factory ServicesResponseBody.fromJson(Map<String, dynamic> json) => ServicesResponseBody(
    id: json["id"],
    userLogin: json["user_login"],
    userPass: json["user_pass"],
    userEmail: json["user_email"],
    userUrl: json["user_url"],
    userRegistered: json["user_registered"] == null ? null : DateTime.parse(json["user_registered"]),
    userActivationKey: json["user_activation_key"],
    userStatus: json["user_status"],
    displayName: json["display_name"],
    roleId: json["role_id"],
    userFirstname: json["user_firstname"],
    userPhonenumber: json["user_phonenumber"],
    userPincode: json["user_pincode"],
    userAddress: json["user_address"],
    userIsloggedin: json["user_isloggedin"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    services: json["services"] == null ? [] : List<Service>.from(json["services"]!.map((x) => Service.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_login": userLogin,
    "user_pass": userPass,
    "user_email": userEmail,
    "user_url": userUrl,
    "user_registered": userRegistered?.toIso8601String(),
    "user_activation_key": userActivationKey,
    "user_status": userStatus,
    "display_name": displayName,
    "role_id": roleId,
    "user_firstname": userFirstname,
    "user_phonenumber": userPhonenumber,
    "user_pincode": userPincode,
    "user_address": userAddress,
    "user_isloggedin": userIsloggedin,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "services": services == null ? [] : List<dynamic>.from(services!.map((x) => x.toJson())),
  };
}

class Service {
  int? id;
  String? price;
  String? categoryId;
  String? name;
  dynamic description;
  String? img;
  DateTime? createdAt;
  DateTime? updatedAt;

  Pivot? pivot;

  Service({
    this.id,
    this.price,
    this.categoryId,
    this.name,
    this.description,
    this.img,
    this.createdAt,
    this.updatedAt,
    this.pivot,

  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    id: json["id"],
    price: json["price"],
    categoryId: json["category_id"],
    name: json["name"],
    description: json["description"],
    img: json["img"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "category_id": categoryId,
    "name": name,
    "description": description,
    "img": img,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "pivot": pivot?.toJson(),
  };
}

class Pivot {
  String? userId;
  String? serviceId;
  DateTime? createdAt;

  Pivot({
    this.userId,
    this.serviceId,
    this.createdAt,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    userId: json["user_id"],
    serviceId: json["service_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "service_id": serviceId,
    "created_at": createdAt?.toIso8601String(),
  };
}
