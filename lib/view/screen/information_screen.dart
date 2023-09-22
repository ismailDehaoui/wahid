import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/controller/home_page_controller.dart';
import 'package:wahid/controller/information_controller.dart';
import 'package:wahid/core/class/handling_data_view.dart';
import 'package:wahid/core/constant/color.dart';
import 'package:wahid/core/constant/image_assets.dart';
import 'package:wahid/view/screen/home_page.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int lavel = HomePage.level;
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controllerImp) => HandlingDataView(
            statusRequest: controllerImp.statusRequest,
            widget: Container(
              child: ListView(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: Get.width / 3,
                        color: AppColor.primaryColor,
                      ),
                      Positioned(
                          top: Get.width / 4.5,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.grey[100],
                              backgroundImage:
                                  AssetImage(AppImageAsset.onBoardingImageTow),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text("${controllerImp.firstName} :الإسم"),
                          ),
                          Divider(),
                          ListTile(
                            title: Text("${controllerImp.lastName} :اللقب"),
                          ),
                          Divider(),
                          ListTile(
                            title: Text(
                                "${controllerImp.email} :البريد الإلكتروني"),
                          ),
                          Divider(),
                          ListTile(
                            title: Text("$lavel :مستواك"),
                          ),
                          // Divider(),
                          // ListTile(
                          //   title: Text("${controllerImp.date}"),
                          // ),
                          // Divider(),
                          // ListTile(
                          //   title: Text("${controllerImp.phone}"),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
