import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/controller/Auth/rest_password_controller.dart';
import 'package:wahid/core/constant/color.dart';
import 'package:wahid/view/widget/Auth/custom_buttom_auth.dart';
import 'package:wahid/view/widget/Auth/custom_text_body_auth.dart';
import 'package:wahid/view/widget/Auth/custom_text_form_auth.dart';

import 'package:wahid/view/widget/Auth/custom_text_title_auth.dart';

// ignore: must_be_immutable
class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controllerImp =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          "غير كلمة السر",
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
            CustomTextTitleAuth(text: "كلمة السر الجديدة"),
            SizedBox(
              height: 15, //65
            ),
            CustomTextBodyAuth(text: "أدخل كلمة السر الجديدة من فضلك"),
            CustomTextFormAuth(
              controller: controllerImp.password,
              isNumber: false,
              valid: (val) {
                return "سنعود";
              },
              hitText: "الرجاء إدخل كلمة السر الجديدة",
              iconData: Icons.lock_outlined,
              labelText: " كلمة السر الجديدة",
            ),
            CustomTextFormAuth(
              controller: controllerImp.resetPassword,
              isNumber: false,
              valid: (val) {
                return "سنعود";
              },
              hitText: "الرجاء أعد إدخال كلمة السر",
              iconData: Icons.lock_outlined,
              labelText: " كلمة السر الجديدة",
            ),
            CustomButtomAuth(
              onPressed: () {
                controllerImp.goToSuccessResetPassword();
              },
              text: "!حفظ",
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
