import 'package:ecommerce_app/core/view%20model/auth_view_model.dart';
import 'package:ecommerce_app/core/view%20model/cart_view_model.dart';
import 'package:ecommerce_app/core/view%20model/control_view_model.dart';
import 'package:ecommerce_app/core/view%20model/home_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
  }
}
