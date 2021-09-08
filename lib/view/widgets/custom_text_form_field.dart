import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hint;
  final FormFieldValidator<String>? onSave;
  final FormFieldValidator<String>? validator;

   CustomTextFormField({
    Key? key,
    required this.text,
    required this.hint,
    this.onSave,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text,
            color: Colors.grey.shade900,
            fontSize: 14,
          ),
          TextFormField(
            onSaved: onSave,
            validator: validator,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.black),
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
