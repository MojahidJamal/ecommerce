import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/view/second_screen.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/custom_button.dart';
import 'widgets/custom_social_button.dart';
import 'widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 50.0,
          right: 20.0,
          left: 20.0,
        ),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Welcome,',
                  fontSize: 30,
                ),
                CustomText(
                  text: 'SignUp',
                  color: primaryColor,
                  fontSize: 18,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text: 'Sign in to continue',
              color: Colors.grey,
              fontSize: 14,
            ),
            SizedBox(
              height: 30,
            ),
            CustomTextFormField(
              hint: 'iamdavid@gmail.com',
              text: 'Email',
              onSave: (value) {},
              validator: (value) {},
            ),
            SizedBox(
              height: 40,
            ),
            CustomTextFormField(
              text: 'Password',
              hint: '********',
              onSave: (value) {},
              validator: (value) {},
            ),
            SizedBox(
              height: 20,
            ),
            CustomText(
              text: 'Forget Password?',
              fontSize: 14,
              alignment: Alignment.topRight,
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              text: 'SIGN IN',
              onPressed: () {
                Get.to(SecondScreen());
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomText(
              text: '-OR-',
              alignment: Alignment.center,
            ),
            SizedBox(
              height: 40,
            ),
            CustomSocialButton(
              text: 'Sign in with Facebook',
              imageName: 'assets/images/facebook.png',
              onPressed: () {},
            ),
            SizedBox(
              height: 40,
            ),
            CustomSocialButton(
              text: 'Sign in with Google',
              imageName: 'assets/images/google.png',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
