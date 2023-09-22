import 'package:get/get.dart';
import 'package:wahid/core/class/status_request.dart';
import 'package:wahid/core/constant/name_routes.dart';
import 'package:wahid/core/functions/handiling_data.dart';
import 'package:wahid/core/services/services.dart';
import 'package:wahid/data/dataSource/remote/home_date.dart';

abstract class HomeController extends GetxController {
  initiaData();
  logout();
  getData();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? date;

  HomePageData homePageData = HomePageData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  //List data = [];
  List categories = [];
  @override
  initiaData() {
    firstName = myServices.sharedPreferences.getString("firstName");
    lastName = myServices.sharedPreferences.getString("lastName");
    email = myServices.sharedPreferences.getString("email");
    phone = myServices.sharedPreferences.getString("phone");
    date = myServices.sharedPreferences.getString("date_birthday");
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homePageData.getData();
    //print("=================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        categories.addAll(response['categories']);
        //print("cat !: $categories");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    initiaData();
    super.onInit();
  }

  @override
  logout() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppNameRoute.login);
  }
}
