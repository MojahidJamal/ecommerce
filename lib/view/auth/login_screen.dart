import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/view%20model/auth_view_model.dart';
import 'package:ecommerce_app/view/auth/register_view.dart';
// import 'package:ecommerce_app/view/facebook_login_screen.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_social_button.dart';
import '../widgets/custom_text_form_field.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Welcome,',
                    fontSize: 30,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => RegisterScreen()),
                    child: CustomText(
                      text: 'SignUp',
                      color: primaryColor,
                      fontSize: 18,
                    ),
                  ),
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
                onSave: (value) {
                  controller.email = value!;
                },
                validator: (value) {
                  if (value == null) {
                    print('error');
                  }
                },
              ),
              SizedBox(
                height: 40,
              ),
              CustomTextFormField(
                text: 'Password',
                hint: '********',
                onSave: (value) {
                  controller.password = value!;
                },
                validator: (value) {
                  if (value == null) {
                    print('error');
                  }
                },
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
                  _formKey.currentState!.save();
                  if (_formKey.currentState!.validate()) {
                    controller.signInWithEmailAndPassword();
                  }
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
                onPressed: () {
                  controller.facebookSignInMethod();
                },
              ),
              SizedBox(
                height: 40,
              ),
              CustomSocialButton(
                text: 'Sign in with Google',
                imageName: 'assets/images/google.png',
                onPressed: () {
                  controller.googleSignInMethod();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
