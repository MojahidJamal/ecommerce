import 'package:ecommerce_app/core/view%20model/auth_view_model.dart';
import 'package:ecommerce_app/core/view%20model/control_view_model.dart';
import 'package:ecommerce_app/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  ControlView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Get.find<AuthViewModel>().user != null
            ? GetBuilder<ControlViewModel>(
                builder: (controller) {
                  return Scaffold(
                    body: controller.currentScreen,
                    bottomNavigationBar: _buildBottomNavBar(),
                  );
                },
              )
            : LoginScreen();
      },
    );
  }

  Widget _buildBottomNavBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) {
        return BottomNavigationBar(
          elevation: 0.0,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.grey.shade100,
          currentIndex: controller.navigatorValue,
          onTap: (index) {
            controller.changeSelectedValue(index);
          },
          items: [
            BottomNavigationBarItem(
              label: '',
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text('Explore'),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/Icon_Explore.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text('Cart'),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/Icon_Cart.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text('Account'),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/Icon_User.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
