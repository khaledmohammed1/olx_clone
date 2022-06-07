// class CategoryModel {
//   String? name, image;
//
//   CategoryModel({ this.name, this.image});
//
//   CategoryModel.fromJson(Map<dynamic, dynamic> map) {
//     if (map == null) {
//       return;
//     }
//     name = map['name'];
//     image = map['image'];
//   }
//
//   toJson() {
//     return {
//       'name': name,
//       'image': image,
//     };
//   }
// }

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    required this.image,
    required this.name,
  });

  String image;
  String name;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    image: json["image"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "name": name,
  };
}