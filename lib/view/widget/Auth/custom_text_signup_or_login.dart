import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomTextSignUpOrLogin extends StatelessWidget {
  final String textOne;
  final String textTow;
  final void Function() onTap;
  CustomTextSignUpOrLogin(
      {super.key,
      required this.textOne,
      required this.textTow,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          child: Text(
            textTow,
            style: TextStyle(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(textOne),
      ],
    );
  }
}
