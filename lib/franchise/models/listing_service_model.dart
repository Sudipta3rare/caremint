//
// class ListedServicesResponse {
//   List<Body>? body;
//
//   ListedServicesResponse({
//     this.body,
//   });
//
//   factory ListedServicesResponse.fromJson(Map<String, dynamic> json) => ListedServicesResponse(
//     body: json["body"] == null ? [] : List<Body>.from(json["body"]!.map((x) => Body.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "body": body == null ? [] : List<dynamic>.from(body!.map((x) => x.toJson())),
//   };
// }
//
// class Body {
//   int? id;
//   String? userLogin;
//   String? userPass;
//   String? userEmail;
//   dynamic userUrl;
//   DateTime? userRegistered;
//   dynamic userActivationKey;
//   String? userStatus;
//   String? displayName;
//   String? roleId;
//   String? userFirstname;
//   String? userPhonenumber;
//   String? userPincode;
//   String? userAddress;
//   dynamic userIsloggedin;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   List<ListedCategory>? categories;
//
//   Body({
//     this.id,
//     this.userLogin,
//     this.userPass,
//     this.userEmail,
//     this.userUrl,
//     this.userRegistered,
//     this.userActivationKey,
//     this.userStatus,
//     this.displayName,
//     this.roleId,
//     this.userFirstname,
//     this.userPhonenumber,
//     this.userPincode,
//     this.userAddress,
//     this.userIsloggedin,
//     this.createdAt,
//     this.updatedAt,
//     this.categories,
//   });
//
//   factory Body.fromJson(Map<String, dynamic> json) => Body(
//     id: json["id"],
//     userLogin: json["user_login"],
//     userPass: json["user_pass"],
//     userEmail: json["user_email"],
//     userUrl: json["user_url"],
//     userRegistered: json["user_registered"] == null ? null : DateTime.parse(json["user_registered"]),
//     userActivationKey: json["user_activation_key"],
//     userStatus: json["user_status"],
//     displayName: json["display_name"],
//     roleId: json["role_id"],
//     userFirstname: json["user_firstname"],
//     userPhonenumber: json["user_phonenumber"],
//     userPincode: json["user_pincode"],
//     userAddress: json["user_address"],
//     userIsloggedin: json["user_isloggedin"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//     categories: json["categories"] == null ? [] : List<ListedCategory>.from(json["categories"]!.map((x) => ListedCategory.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "user_login": userLogin,
//     "user_pass": userPass,
//     "user_email": userEmail,
//     "user_url": userUrl,
//     "user_registered": userRegistered?.toIso8601String(),
//     "user_activation_key": userActivationKey,
//     "user_status": userStatus,
//     "display_name": displayName,
//     "role_id": roleId,
//     "user_firstname": userFirstname,
//     "user_phonenumber": userPhonenumber,
//     "user_pincode": userPincode,
//     "user_address": userAddress,
//     "user_isloggedin": userIsloggedin,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//     "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
//   };
// }
//
// class ListedCategory {
//   int? id;
//   String? categoryName;
//   String? img;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   Pivot? pivot;
//
//   ListedCategory({
//     this.id,
//     this.categoryName,
//     this.img,
//     this.createdAt,
//     this.updatedAt,
//     this.pivot,
//   });
//
//   factory ListedCategory.fromJson(Map<String, dynamic> json) => ListedCategory(
//     id: json["id"],
//     categoryName: json["category_name"],
//     img: json["img"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//     pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "category_name": categoryName,
//     "img": img,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//     "pivot": pivot?.toJson(),
//   };
// }
//
// class Pivot {
//   String? userId;
//   String? categoryId;
//   DateTime? createdAt;
//
//   Pivot({
//     this.userId,
//     this.categoryId,
//     this.createdAt,
//   });
//
//   factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
//     userId: json["user_id"],
//     categoryId: json["category_id"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "user_id": userId,
//     "category_id": categoryId,
//     "created_at": createdAt?.toIso8601String(),
//   };
// }
