import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/core/class/status_request.dart';
import 'package:wahid/core/constant/name_routes.dart';
import 'package:wahid/core/functions/handiling_data.dart';
import 'package:wahid/core/services/services.dart';
import '../../data/dataSource/remote/auth/signup.dart';

abstract class SingUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SingUpControllerImp extends SingUpController {
  MyServices myServices = Get.find();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  late TextEditingController dateOfBirthday;
  late TextEditingController gender;

  late StatusRequest statusRequest = StatusRequest.none;

  SignUpData signupData = SignUpData(Get.find());
  List data = [];
  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await signupData.postdata(
          firstName.text, lastName.text, email.text, password.text, phone.text);
      // print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          // myServices.sharedPreferences
          //     .setString("firstName", response['data']['firstName']);
          // myServices.sharedPreferences
          //     .setString("lastName", response['data']['lastName']);
          // myServices.sharedPreferences
          //     .setString("email", response['data']['email']);
          // myServices.sharedPreferences
          //     .setString("phone", response['data']['phone']);
          // myServices.sharedPreferences
          //     .setString("date_birthday", response['data']['date_birthday']);
          // // myServices.sharedPreferences
          //     .setString("level", response['data']['level']);

          // myServices.sharedPreferences.setString("step", "2");

          Get.offNamed(AppNameRoute.login);
          // print("===============================");
          // // print("id : ${response['data']['id']}");
          // print("firstName : ${response['data']['firstName']}");
          // print("lastname : ${response['data']['lastName']}");
          // print("email : ${response['data']['email']}");
          // //print("date : ${response['data']['id']}");
          // print("phone : ${response['data']['phone']}");
          // print("===============================");
        } else {
          Get.defaultDialog(
              title: "ُWarning",
              middleText: "Phone Number Or Email Already Exists");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  /*
  singUp() async {
    if (formState.currentState!.validate()) {
      print("forma data is validate");
      statusRequest = StatusRequest.loading;
      var response = signupData.postdata(
          firstName.text, lastName.text, email.text, password.text, phone.text);
      print("=================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          //data.addAll(response['data']);
          Get.offAllNamed(AppNameRoute.verfiyCodeSignUp);
        } else {
          Get.defaultDialog(
              title: "Warning",
              middleText: "رقم الهاتف أو البريد الإلكتروني مجود");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("not valid");
    }
  }
*/
  @override
  goToSignIn() {
    Get.toNamed(AppNameRoute.home);
  }

  @override
  void onInit() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    dateOfBirthday = TextEditingController();
    gender = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    dateOfBirthday.dispose();
    gender.dispose();
    super.dispose();
  }
}
