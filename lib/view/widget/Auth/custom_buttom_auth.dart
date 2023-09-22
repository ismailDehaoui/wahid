import 'package:flutter/material.dart';
import 'package:wahid/core/constant/color.dart';

class CustomButtomAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  CustomButtomAuth({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        padding: const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text(text),
      ),
    );
  }
}
