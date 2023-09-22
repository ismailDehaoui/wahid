import 'package:get/get.dart';
import 'package:wahid/core/constant/name_routes.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToRestPassword();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  late String verifyCode;
  @override
  checkCode() {}

  @override
  goToRestPassword() {
    Get.toNamed(AppNameRoute.resetPassword);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
