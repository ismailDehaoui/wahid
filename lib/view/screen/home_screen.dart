import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/controller/home_screen_controller.dart';
import 'package:wahid/view/widget/home/custom_button_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
            bottomNavigationBar: BottomAppBar(
              child: Row(
                children: [
                  Row(
                    children: [
                      CustomButtonAppBar(
                        textButton: "الإعدادات",
                        iconData: Icons.settings_outlined,
                        active: controller.currentPage == 1 ? true : false,
                        onPressed: () {
                          controller.changePage(1);
                        },
                      )
                    ], // الإعدادات
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CustomButtonAppBar(
                        textButton: "الرئيسة",
                        iconData: Icons.home,
                        active: controller.currentPage == 0 ? true : false,
                        onPressed: () {
                          controller.changePage(0);
                        },
                      )
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CustomButtonAppBar(
                        textButton: "الإختبارات",
                        iconData: Icons.library_add_check_rounded,
                        active: controller.currentPage == 2 ? true : false,
                        onPressed: () {
                          controller.changePage(2);
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
            body: controller.listPage.elementAt(controller.currentPage)));
  }
}
