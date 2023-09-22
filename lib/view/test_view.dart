import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/controller/test_controller.dart';
import 'package:wahid/core/class/handling_data_view.dart';
import 'package:wahid/core/constant/color.dart';

class TestView extends StatelessWidget {
  TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text("Titel"),
      ),
      body: GetBuilder<TestController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Text("${controller.data}");
              },
            ),
          );
        },
      ),
    );
  }
}
