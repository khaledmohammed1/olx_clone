import 'dart:convert';

CartProductModel cartProductModelFromJson(String str) => CartProductModel.fromJson(json.decode(str));

String cartProductModelToJson(CartProductModel data) => json.encode(data.toJson());

class CartProductModel {
  CartProductModel({
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
    required this.productId,

  });

  String name, image, price,productId;
  int quantity;

  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      CartProductModel(
        name: json['name'],
        image: json['image'],
        quantity: json['quantity'],
        price: json['price'],
        productId: json['productId'],
      );

  Map<String, dynamic> toJson() =>
      {
        "image": image,
        "name": name,
        "quantity": quantity,
        "price": price,
        "productId": productId,
      };
}
