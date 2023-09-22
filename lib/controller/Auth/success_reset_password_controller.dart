import 'package:get/get.dart';
import 'package:wahid/core/constant/name_routes.dart';

abstract class SuccessResetPasswordController extends GetxController {
  goToPageLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  goToPageLogin() {
    Get.offAllNamed(AppNameRoute.login);
  }
}
