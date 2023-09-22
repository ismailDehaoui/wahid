import 'package:get/get.dart';
import 'package:wahid/core/class/status_request.dart';
import 'package:wahid/core/functions/handiling_data.dart';
import 'package:wahid/core/services/services.dart';
import 'package:wahid/data/dataSource/remote/information_data.dart';

abstract class InformationController extends GetxController {
  initiaData();
  getData();
  logout();
}

class InformationControllerImp extends InformationController {
  MyServices myServices = Get.find();
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? date;
  int? level;
  StatusRequest statusRequest = StatusRequest.none;
  InformationData informationData = InformationData(Get.find());
  @override
  logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await informationData.getData("$email");
    // print("=================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        myServices.sharedPreferences.setString("id", response['data']['id']);
        myServices.sharedPreferences
            .setString("firstName", response['data']['firstName']);
        myServices.sharedPreferences
            .setString("lastName", response['data']['lastName']);
        myServices.sharedPreferences
            .setString("email", response['data']['email']);
        myServices.sharedPreferences
            .setString("phone", response['data']['phone']);
        myServices.sharedPreferences.setInt("level", response['data']['level']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  initiaData() {
    firstName = myServices.sharedPreferences.getString("firstName");
    lastName = myServices.sharedPreferences.getString("lastName");
    email = myServices.sharedPreferences.getString("email");
    phone = myServices.sharedPreferences.getString("phone");
    level = myServices.sharedPreferences.getInt("level");
  }
}
