import 'package:flutter/material.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String text;
  CustomTextTitleAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
