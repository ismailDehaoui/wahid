import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/core/constant/name_routes.dart';
import 'package:wahid/core/services/services.dart';

class MyMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: AppNameRoute.home);
    }
    if (myServices.sharedPreferences.getString("step") == "1") {
      //print("hi");
      return const RouteSettings(name: AppNameRoute.login);
    }
    return null;
  }
}
