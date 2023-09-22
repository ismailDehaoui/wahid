import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/view/screen/home_page.dart';
import 'package:wahid/view/screen/quiz/alphabit_quiz_screen.dart';
import 'package:wahid/view/screen/information_screen.dart';
import 'package:wahid/view/screen/quiz_page/quiz_screen.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  List<Widget> listPage = [
    const HomePage(),
    const InformationScreen(),
    const QuizScreen(),
  ];
  //List titleBottomAappBar = ["الإعدادات", "الإختبارات", "الرئيسية"];
  @override
  changePage(int index) {
    currentPage = index;
    update();
  }
}
