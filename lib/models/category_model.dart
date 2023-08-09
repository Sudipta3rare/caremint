

class CategoryResponse {
  List<Category>? body;

  CategoryResponse({
    this.body,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => CategoryResponse(
    body: json["body"] == null ? [] : List<Category>.from(json["body"]!.map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "body": body == null ? [] : List<dynamic>.from(body!.map((x) => x.toJson())),
  };
}

class Category {
  int? id;
  String? categoryName;
  String? img;
  DateTime? createdAt;
  DateTime? updatedAt;

  Category({
    this.id,
    this.categoryName,
    this.img,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    categoryName: json["category_name"],
    img: json["img"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_name": categoryName,
    "img": img,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
