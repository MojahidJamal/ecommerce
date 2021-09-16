import 'package:ecommerce_app/helper/extension.dart';
import 'package:flutter/cupertino.dart';

class ProductModel {
  late final String? name, image, description, size, price;
  late Color color;

  ProductModel({
    required this.name,
    required this.image,
    required this.description,
    required this.color,
    required this.size,
    required this.price,
  });

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    size = map['size'];
    price = map['price'];
  }
  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'size': size,
      'price': price,
    };
  }
}
