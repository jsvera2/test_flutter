// To parse this JSON data, do
//
//     final myModel = myModelFromJson(jsonString);

import 'dart:convert';

class MyModel {
  MyModel({
    required this.name,
    required this.age,
    required this.status,
  });

  String name;
  int age;
  bool status;

  factory MyModel.fromRawJson(String str) => MyModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MyModel.fromJson(Map<String, dynamic> json) => MyModel(
        name: json["name"],
        age: json["age"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "status": status,
      };
}
