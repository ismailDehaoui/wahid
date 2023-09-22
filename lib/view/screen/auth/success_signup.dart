import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/controller/Auth/success_signup_controller.dart';
import 'package:wahid/core/constant/color.dart';
import 'package:wahid/view/widget/Auth/custom_buttom_auth.dart';

class SuccessSignUp extends StatelessWidget {
  SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controllerImp =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        title: Text(
          "تسجيل الدخول",
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 150,
                color: Colors.green,
              ),
            ),
            Text('تم التحقق من الرمز المرسل بنجاح '),
            Container(
              width: double.infinity,
              child: CustomButtomAuth(
                text: "إنتقل الى صفحة الرئيسية",
                onPressed: () {
                  controllerImp.goToPageLogin();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
