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


CartProductModel categoryModelFromJson(String str) => CartProductModel.fromJson(json.decode(str));

String categoryModelToJson(CartProductModel data) => json.encode(data.toJson());

class CartProductModel {
  CartProductModel({
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,

  });

  String name, image, quantity, price;


  factory CartProductModel.fromJson(Map<String, dynamic> json) => CartProductModel(
    name : json['name'],
    image : json['image'],
    quantity : json['quantity'],
    price : json['price'],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "name": name,
    "quantity": quantity,
    "price": price,
  };
}