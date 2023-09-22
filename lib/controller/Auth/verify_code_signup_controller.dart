import 'package:get/get.dart';
import 'package:wahid/core/constant/name_routes.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  late String verifyCode;
  @override
  checkCode() {}

  @override
  goToSuccessSignUp() {
    Get.toNamed(AppNameRoute.successSignUp);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
