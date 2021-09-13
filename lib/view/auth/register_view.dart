import 'package:ecommerce_app/core/view%20model/auth_view_model.dart';
import 'package:ecommerce_app/view/auth/login_screen.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:ecommerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  RegisterScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Get.offAll((LoginScreen())),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
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
              CustomText(
                text: 'Sign Up,',
                fontSize: 30,
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                hint: 'Cezar',
                text: 'Name',
                onSave: (value) {
                  controller.name = value!;
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
              CustomButton(
                text: 'SIGN UP',
                onPressed: () {
                  _formKey.currentState!.save();
                  if (_formKey.currentState!.validate()) {
                    controller.signUpWithEmailAndPassword();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
