import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/controller/Auth/forgetpassword_contrroler.dart';
import 'package:wahid/core/constant/color.dart';
import 'package:wahid/view/widget/Auth/custom_text_form_auth.dart';
import 'package:wahid/view/widget/Auth/custom_text_title_auth.dart';
import '../../../widget/Auth/custom_buttom_auth.dart';

// ignore: must_be_immutable
class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controllerImp =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          "هل نسيت كلمة السر؟",
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
            CustomTextTitleAuth(text: "تحقق من البريد الإلكتروني"),
            SizedBox(
              height: 15, //65
            ),
            CustomTextFormAuth(
              controller: controllerImp.email,
              isNumber: false,
              valid: (val) {
                return "سنعود";
              },
              hitText: "الرجاء ادخال البريد لتلقي رمز التحقق",
              iconData: Icons.email_outlined,
              labelText: "البريد الالكتروني",
            ),
            CustomButtomAuth(
              onPressed: () {
                controllerImp.goToVerfiyCode();
              },
              text: "!تحقق",
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
