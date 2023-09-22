import 'package:get/get.dart';
import 'package:wahid/core/constant/name_routes.dart';

abstract class SuccessSignUpController extends GetxController {
  goToPageLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  goToPageLogin() {
    Get.offAllNamed(AppNameRoute.login);
  }
}
