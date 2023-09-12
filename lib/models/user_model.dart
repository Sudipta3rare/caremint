import 'dart:convert';

class UserResponse {
  String? message;
  User? user;
  String? token;

  UserResponse({
    this.message,
    this.user,
    this.token,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    message: json["message"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user?.toJson(),
    "token": token,
  };
}

class User {
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

  User({
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
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    userLogin: json["user_login"] ?? "",
    userPass: json["user_pass"] ,
    userEmail: json["user_email"],
    userUrl: json["user_url"] ?? "",
    userRegistered: json["user_registered"] == null ? null : DateTime.parse(json["user_registered"]),
    userActivationKey: json["user_activation_key"] ,
    userStatus: json["user_status"],
    displayName: json["display_name"] ?? "",
    roleId: json["role_id"],
    userFirstname: json["user_firstname"] ?? "",
    userPhonenumber: json["user_phonenumber"],
    userPincode: json["user_pincode"],
    userAddress: json["user_address"],
    userIsloggedin: json["user_isloggedin"] ?? "",
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_login": userLogin,
    "user_pass": userPass,
    "user_email": userEmail,
    "user_url": userUrl,
    "user_registered": userRegistered?.toString(),
    "user_activation_key": userActivationKey,
    "user_status": userStatus,
    "display_name": displayName,
    "role_id": roleId,
    "user_firstname": userFirstname,
    "user_phonenumber": userPhonenumber,
    "user_pincode": userPincode,
    "user_address": userAddress,
    "user_isloggedin": userIsloggedin,
    "created_at": createdAt?.toString(),
    "updated_at": updatedAt?.toString(),
  };
}


UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());
