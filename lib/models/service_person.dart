

class ProviderResponse {
  List<Provider>? body;

  ProviderResponse({
    this.body,
  });

  factory ProviderResponse.fromJson(Map<String, dynamic> json) => ProviderResponse(
    body: json["body"] == null ? [] : List<Provider>.from(json["body"]!.map((x) => Provider.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "body": body == null ? [] : List<dynamic>.from(body!.map((x) => x.toJson())),
  };
}

class Provider {
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
  String? categoryId;
  String? userId;
  String? pincodeId;

  Provider({
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
    this.categoryId,
    this.userId,
    this.pincodeId,
  });

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
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
    categoryId: json["category_id"],
    userId: json["user_id"],
    pincodeId: json["pincode_id"],
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
    "category_id": categoryId,
    "user_id": userId,
    "pincode_id": pincodeId,
  };
}
