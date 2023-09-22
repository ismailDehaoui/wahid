import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/controller/Auth/login_controller.dart';
import 'package:wahid/core/class/handling_data_view.dart';
import 'package:wahid/core/constant/color.dart';
import 'package:wahid/core/functions/alert_exit_app.dart';
import 'package:wahid/core/functions/valid_input.dart';
import 'package:wahid/view/widget/Auth/custom_text_body_auth.dart';
import 'package:wahid/view/widget/Auth/custom_text_form_auth.dart';
import 'package:wahid/view/widget/Auth/custom_text_signup_or_login.dart';
import 'package:wahid/view/widget/Auth/custom_text_title_auth.dart';
import 'package:wahid/view/widget/Auth/logo_auth.dart';

import '../../widget/Auth/custom_buttom_auth.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
  // 'عادي','يتيم الاب','يتيم الام','يتيم الابوين','الولدين مطلقين'
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
          title: Text(
            "تسجيل الدخول",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<LoginControllerImp>(
              builder: (controllerImp) => HandlingDataRequest(
                statusRequest: controllerImp.statusRequest!,
                widget: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controllerImp.formstate,
                    child: ListView(
                      children: [
                        LogoAuth(),
                        CustomTextTitleAuth(
                          text: "مرحبا بك",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextBodyAuth(
                          text:
                              "سجل دخولك  و إنضم إلى عالمنا  حيث المتعة و المرحة،إصنع بنفسك عالمك الخاص و انطلق في رحلة التعلم معنا",
                        ),
                        SizedBox(
                          height: 15, //65
                        ),
                        CustomTextFormAuth(
                          controller: controllerImp.email,
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 100, "email");
                          },
                          hitText: "ادخل البريد الالكتروني",
                          iconData: Icons.email_outlined,
                          labelText: "البريد الالكتروني",
                        ),
                        GetBuilder<LoginControllerImp>(
                          builder: (controllerImp) => CustomTextFormAuth(
                            controller: controllerImp.password,
                            isNumber: false,
                            obscureText: controllerImp.isShowPassword,
                            onTapIcon: () {
                              controllerImp.showPassword();
                            },
                            valid: (val) {
                              return validInput(val!, 5, 10, "password");
                            },
                            hitText: "ادخل كلمة المرور",
                            iconData: Icons.lock_outlined,
                            labelText: "كلمة المرور",
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controllerImp.goToForgetPassword();
                          },
                          child: Text(
                            "هل نسيت كلمة السر؟",
                            textAlign: TextAlign.left,
                          ),
                        ),
                        CustomButtomAuth(
                          onPressed: () {
                            controllerImp.login();
                          },
                          text: "تسجيل الدخول",
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CustomTextSignUpOrLogin(
                          textOne: "  ليس  لديك حساب؟",
                          textTow: "!سجل حساب جديد",
                          onTap: () {
                            controllerImp.goToSignUp();
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
