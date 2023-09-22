import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/controller/home_page_controller.dart';
import 'package:wahid/core/class/handling_data_view.dart';
import 'package:wahid/core/constant/color.dart';
import 'package:wahid/core/constant/image_assets.dart';
import 'package:wahid/core/constant/name_routes.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List imgs = [
      AppImageAsset.color,
      AppImageAsset.alphabit,
    ];
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controllerImp) => HandlingDataView(
              statusRequest: controllerImp.statusRequest,
              widget: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: IconButton(
                              onPressed: () {
                                controllerImp.logout();
                              },
                              icon: Icon(
                                Icons.logout_sharp,
                                size: 25,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: Text(
                              " ${controllerImp.firstName} ${controllerImp.lastName} مرحبا",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset(AppImageAsset.homePage),
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controllerImp.categories.length,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              decoration: BoxDecoration(
                                  color: AppColor.secondColor,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                    ),
                                  ]),
                              child: Center(
                                  child: Text(
                                "${controllerImp.categories[index]['categories_name']}",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.thirdColor),
                              )));
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 220),
                      child: Text(
                        "الإمتحانات",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemCount: controllerImp.categories.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            if (controllerImp.categories[index]
                                    ['categories_name'] ==
                                "الالوان") {
                              print(
                                  "this first cat it's : ${controllerImp.categories[index]['categories_name']}");
                              Get.toNamed(AppNameRoute.QuizColor);
                            } else {
                              print(
                                  "this sec cat it's : ${controllerImp.categories[index]['categories_name']}");
                              Get.toNamed(AppNameRoute.QuizAlphapit);
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  )
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                    radius: 35,
                                    backgroundImage:
                                        AssetImage("${imgs[index]}")),
                                Text(
                                  "${controllerImp.categories[index]['categories_name']}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    // Container(
                    //   height: 70,
                    //   child: ListView.separated(
                    //     separatorBuilder: (context, index) => SizedBox(
                    //       width: 10,
                    //     ),
                    //     itemCount: controllerImp.categories.length,
                    //     scrollDirection: Axis.horizontal,
                    //     itemBuilder: (context, index) {
                    //       return Column(
                    //         children: [
                    //           Container(
                    //             decoration: BoxDecoration(
                    //               // color: AppColor.thirdColor,
                    //               borderRadius: BorderRadius.circular(20),
                    //             ),
                    //             padding:
                    //                 EdgeInsets.symmetric(horizontal: 10),
                    //             height: 40,
                    //             width: 70,
                    //             child: Image.asset(
                    //               "assets/images/categories/COLORS-FINAL.png",
                    //               color: AppColor.secondColor,
                    //             ),
                    //           ),
                    //           Text(
                    //             "${controllerImp.categories[index]['categories_name']}",
                    //             style: TextStyle(
                    //                 fontSize: 14,
                    //                 color: AppColor.thirdColor),
                    //           )
                    //         ],
                    //       );
                    //     },
                    //   ),
                    // )
                  ],
                ),
              ),
            ));
  }
}
