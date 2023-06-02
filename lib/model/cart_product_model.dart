import 'package:flutter/material.dart';
import 'package:pfa_v2/helper/extension.dart';

class CartProductModel {
  String name, image, price,productId;
  int quantity;

  CartProductModel(
      {this.productId,
        this.name,
        this.image,
        this.price,
        this.quantity,});

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    productId = map['productId'];
    name = map['name'];
    image = map['image'];
    price = map['price'];
    quantity = map['quantity'];
  }

  toJson() {
    return {
      'productId': productId,
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
    };
  }
}
