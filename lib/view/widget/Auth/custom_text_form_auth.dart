import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hitText;
  final String labelText;
  final IconData iconData;
  final TextEditingController controller;
  final bool isNumber;
  final bool? obscureText;
  final String? Function(String?) valid;
  final void Function()? onTapIcon;
  CustomTextFormAuth({
    super.key,
    required this.hitText,
    required this.labelText,
    required this.iconData,
    required this.controller,
    required this.isNumber,
    this.obscureText,
    required this.valid,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        validator: valid,
        controller: controller,
        keyboardType:
            isNumber ? TextInputType.number : TextInputType.emailAddress,
        obscureText: obscureText == null || obscureText == false ? false : true,
        decoration: InputDecoration(
          hintText: hitText,
          hintStyle: const TextStyle(fontSize: 14),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 9),
              child: Text(labelText)),
          suffixIcon: InkWell(onTap: onTapIcon, child: Icon(iconData)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
