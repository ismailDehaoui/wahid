import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/controller/onboarding_controller.dart';
import 'package:wahid/data/dataSource/static/static.dart';

class CustomSliderOnboarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
        print(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) => Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            onBoardingList[index].title!,
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 80,
          ),
          Image.asset(
            onBoardingList[index].image!,
            width: 200,
            height: 200,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 80,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              onBoardingList[index].body!,
              textAlign: TextAlign.center,
              //style: Theme.of(context).textTheme.bodyText1,
            ),
          )
        ],
      ),
    );
  }
}
