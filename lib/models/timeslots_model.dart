class Timeslots {
  List<Body> body;

  Timeslots({
    required this.body,
  });

  factory Timeslots.fromJson(Map<String, dynamic> json) => Timeslots(
    body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "body": List<dynamic>.from(body.map((x) => x.toJson())),
  };
}

class Body {
  int id;
  String slots;
  DateTime createdAt;
  DateTime updatedAt;

  Body({
    required this.id,
    required this.slots,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    id: json["id"],
    slots: json["slots"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slots": slots,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
