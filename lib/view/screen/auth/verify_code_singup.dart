import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:wahid/controller/Auth/verify_code_signup_controller.dart';
import 'package:wahid/core/constant/color.dart';
import 'package:wahid/view/widget/Auth/custom_text_body_auth.dart';

// ignore: must_be_immutable
class VerfiyCodeSignUp extends StatelessWidget {
  VerfiyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeSignUpControllerImp controllerImp =
        Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          "التحقق من الرمز المرسل",
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            CustomTextBodyAuth(
                text: "من فضلك أدخل رمز التحقق المرسل لك إلى بريدك الإلكتروني"),
            SizedBox(
              height: 15, //65
            ),
            OtpTextField(
              fieldWidth: 50.0,
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 5,
              borderColor: Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                controllerImp.goToSuccessSignUp();
              }, // end onSubmit
            ),
          ],
        ),
      ),
    );
  }
}
