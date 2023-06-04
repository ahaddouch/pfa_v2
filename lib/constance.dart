import 'package:flutter/material.dart';

const primaryColor = Color.fromRGBO(70, 180, 229, 1);
const secondaryColor = Color.fromRGBO(255, 255, 255, 1);
final String tableCartProduct = 'cartProduct';
final String columnName = 'name';
final String columnImage = 'image';
final String columnPrice = 'price';
final String columnQuantity = 'quantity';
final String columnProductId = 'productId';
const CACHED_USER_DATA = 'CACHED_USER_DATA';

const kTileHeight = 50.0;
const inProgressColor = Colors.black87;
const todoColor = Color(0xffd1d2d7);

enum Pages {
  deliveryTime,
  addAddress,
  summary,
}