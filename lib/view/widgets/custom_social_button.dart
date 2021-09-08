import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomSocialButton extends StatelessWidget {
  final String text;
  final String imageName;
  final VoidCallback onPressed;
  const CustomSocialButton({
    Key? key,
    required this.text,
    required this.imageName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {  
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
      ),
      // ignore: deprecated_member_use
      child: FlatButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset(imageName),
            SizedBox(
              width: 70,
            ),
            CustomText(
              text: text,
            )
          ],
        ),
      ),
    );
  }
}
