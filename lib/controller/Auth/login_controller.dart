import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/core/class/status_request.dart';
import 'package:wahid/core/constant/name_routes.dart';
import 'package:wahid/core/functions/handiling_data.dart';
import 'package:wahid/core/services/services.dart';
import 'package:wahid/data/dataSource/remote/auth/login.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isShowPassword = true;
  MyServices myServices = Get.find();
  StatusRequest? statusRequest = StatusRequest.none;
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await loginData.postdata(email.text, password.text);
      //print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          myServices.sharedPreferences.setString("id", response['data']['id']);
          myServices.sharedPreferences
              .setString("firstName", response['data']['firstName']);
          myServices.sharedPreferences
              .setString("lastName", response['data']['lastName']);
          myServices.sharedPreferences
              .setString("email", response['data']['email']);
          myServices.sharedPreferences
              .setString("phone", response['data']['phone']);
          myServices.sharedPreferences
              .setString("date_birthday", response['data']['date_birthday']);
          // myServices.sharedPreferences
          //     .setInt("level", response['data']['level']);

          myServices.sharedPreferences.setString("step", "2");

          Get.offNamed(AppNameRoute.home);
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: "Password Or Email Not correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignUp() {
    Get.offNamed(AppNameRoute.signUp);
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppNameRoute.forgetPassword);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print('tokne : $value');
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
