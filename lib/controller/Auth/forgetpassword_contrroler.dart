import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/core/constant/name_routes.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
  goToVerfiyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;
  @override
  checkEmail() {}

  @override
  goToVerfiyCode() {
    Get.toNamed(AppNameRoute.verfiyCode);
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
