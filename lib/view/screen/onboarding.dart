import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/controller/onboarding_controller.dart';
import 'package:wahid/view/widget/onBording/customButton.dart';
import 'package:wahid/view/widget/onBording/custom_slider.dart';
import 'package:wahid/view/widget/onBording/dot_controller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(flex: 5, child: CustomSliderOnboarding()),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                CustomDotControllerOnboarding(),
                Spacer(
                  flex: 2,
                ),
                CustomButtonOnboarding(),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
