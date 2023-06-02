import 'package:flutter/material.dart';
import 'package:pfa_v2/helper/extension.dart';

class ProductModel {
  String productId, name, image, description, size, price;
  Color color;

  ProductModel(
      {
        this.productId,
        this.name,
      this.image,
      this.description,
      this.color,
      this.size,
      this.price});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    productId = map['productId'];
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    size = map['size'];
    price = map['price'];

  }

  toJson() {
    return {
      'productId': productId,
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'size': size,
      'price': price,
    };
  }
}
