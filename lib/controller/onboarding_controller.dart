import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/core/constant/name_routes.dart';
import 'package:wahid/core/services/services.dart';
import 'package:wahid/data/dataSource/static/static.dart';

abstract class OnBoardingController extends GetxController {
  nextPage();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  int currentPage = 0;

  MyServices myServices = Get.find();

  @override
  nextPage() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppNameRoute.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
