import 'package:ecommerce_app/core/service/home_service.dart';
import 'package:ecommerce_app/model/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;

  

  HomeViewModel() {
    getCategory();
  }

  getCategory() async {
    _loading.value = true;
    await HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(
            value[i].data()! as Map<dynamic, dynamic>));
        _loading.value = false;
      }
      print(_categoryModel.length);
      update();
      
    });
  }
}
