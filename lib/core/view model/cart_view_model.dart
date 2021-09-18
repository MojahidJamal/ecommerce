import 'package:ecommerce_app/core/service/database/cart_db_helper.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  CartViewModel() {
    getAllProducts();
  }

  getAllProducts() async {
    _loading.value = true;
    var dbHelper = CartDBHelper.db;
    _cartProductModel = await dbHelper.getAllProduct();
    print(_cartProductModel.length);
    _loading.value = false;
    update();
  }

  addToCart(CartProductModel cartProductModel) async {
    var dbHelper = CartDBHelper.db;
    await dbHelper.insert(cartProductModel);
    update();
  }
}
