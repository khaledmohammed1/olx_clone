// import 'package:flutter/material.dart';
//
// class ProductModel {

//
//   ProductModel(
//       {this.name,
//         this.image,
//         this.description,
//         this.color,
//         this.sized,
//         this.price});
//
//   factory ProductModel.fromJson(Map<dynamic, dynamic> map) {
//     if (map == null) {
//       return;
//     }
//

//
//   toJson() {
//     return {
//       'name': name,
//       'image': image,
//       'description': description,
//       'color': color,
//       'sized': sized,
//       'price': price,
//     };
//   }
// }

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


ProductModel categoryModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String categoryModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.image,
    required this.name,
    required this.price,
    required this.description,

  });

  String name, image, description, price;


  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      name : json['name'],
      image : json['image'],
      description : json['description'],
      price : json['price'],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "name": name,
    "description": description,
    "price": price,
  };
}