import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/controller/onboarding_controller.dart';
import 'package:wahid/core/constant/color.dart';
import 'package:wahid/data/dataSource/static/static.dart';

class CustomDotControllerOnboarding extends StatelessWidget {
  const CustomDotControllerOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  onBoardingList.length,
                  (index) => AnimatedContainer(
                    margin: EdgeInsets.only(right: 5),
                    duration: Duration(milliseconds: 900),
                    width: controller.currentPage == index ? 20 : 5,
                    height: 6,
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ));
  }
}
