import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/core/constant/name_routes.dart';

abstract class ResetPasswordController extends GetxController {
  resetpassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController resetPassword;
  @override
  resetpassword() {}

  @override
  goToSuccessResetPassword() {
    Get.toNamed(AppNameRoute.successResetPassword);
  }

  @override
  void onInit() {
    password = TextEditingController();
    resetPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    resetPassword.dispose();
    super.dispose();
  }
}
