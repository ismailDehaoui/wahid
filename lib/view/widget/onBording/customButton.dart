import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/controller/onboarding_controller.dart';
import 'package:wahid/core/constant/color.dart';

class CustomButtonOnboarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      height: 40,
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 0),
        textColor: Colors.white,
        onPressed: () {
          controller.nextPage();
        },
        color: AppColor.primaryColor,
        child: Text(
          "تابـــــع",
        ),
      ),
    );
  }
}
