import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "تنبيــــه",
      middleText: "هل تريد الخروج من التطبيق؟",
      actions: [
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text('لا')),
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: Text('موافق')),
      ]);
  return Future.value(true);
}
