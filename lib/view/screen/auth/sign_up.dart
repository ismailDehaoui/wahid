import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/controller/Auth/signup_controller.dart';
import 'package:wahid/core/class/handling_data_view.dart';
import 'package:wahid/core/constant/color.dart';
import 'package:wahid/core/functions/alert_exit_app.dart';
import 'package:wahid/core/functions/valid_input.dart';
import 'package:wahid/view/widget/Auth/custom_text_body_auth.dart';
import 'package:wahid/view/widget/Auth/custom_text_form_auth.dart';
import 'package:wahid/view/widget/Auth/custom_text_title_auth.dart';
import '../../widget/Auth/custom_buttom_auth.dart';
import '../../widget/Auth/custom_text_signup_or_login.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  SignUp({super.key});
  String? gender;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SingUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
          title: Text(
            "أنشأ حساب جديد",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<SingUpControllerImp>(
            builder: (controllerImp) => HandlingDataRequest(
              statusRequest: controllerImp.statusRequest,
              widget: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                  key: controllerImp.formstate,
                  child: ListView(
                    children: [
                      CustomTextTitleAuth(
                        text: "سجل حسابك الآن",
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
                        controller: controllerImp.firstName,
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 3, 30, "firstName");
                        },
                        hitText: "أدخل إسمك",
                        iconData: Icons.person,
                        labelText: "الاسم",
                      ),
                      CustomTextFormAuth(
                        controller: controllerImp.lastName,
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 3, 30, "LastName");
                        },
                        hitText: "أدخل لقبك",
                        iconData: Icons.person,
                        labelText: "اللقب",
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
                      CustomTextFormAuth(
                        controller: controllerImp.password,
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 5, 10, "password");
                        },
                        hitText: "ادخل كلمة المرور",
                        iconData: Icons.lock_outlined,
                        labelText: "كلمة المرور",
                      ),
                      CustomTextFormAuth(
                        controller: controllerImp.phone,
                        isNumber: true,
                        valid: (val) {
                          return validInput(val!, 10, 10, "phone");
                        },
                        hitText: "أدخل رقم الهاتف",
                        iconData: Icons.phone,
                        labelText: "رقم الهاتف",
                      ),
                      CustomTextFormAuth(
                        controller: controllerImp.dateOfBirthday,
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 5, 30, "date");
                        },
                        hitText: "أدخل تاريخ ميلادك",
                        iconData: Icons.date_range_outlined,
                        labelText: "تاريخ الميلاد",
                      ),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Row(
                      //       children: [
                      //         Center(
                      //           child: Row(
                      //             children: [
                      //               Text(
                      //                 "ذكر",
                      //                 style: TextStyle(
                      //                     fontSize: 15,
                      //                     fontWeight: FontWeight.w100,
                      //                     color: AppColor.primaryColor),
                      //               ),
                      //               Radio(
                      //                 value: 'homme',
                      //                 groupValue: gender,
                      //                 onChanged: (val) {
                      //                   gender = val!;

                      //                   //print(gender);
                      //                   //print(controllerImp.gender.text);
                      //                 },
                      //                 activeColor: Color.fromARGB(255, 26, 6, 249),
                      //                 fillColor: MaterialStateProperty.all(
                      //                     Color.fromARGB(255, 26, 6, 249)),
                      //               ),
                      //               SizedBox(
                      //                 width: 5.0,
                      //               ),
                      //               Text(
                      //                 "أنثى",
                      //                 style: TextStyle(
                      //                     fontSize: 15,
                      //                     fontWeight: FontWeight.w100,
                      //                     color: AppColor.primaryColor),
                      //               ),
                      //               Radio(
                      //                 value: 'femme',
                      //                 groupValue: gender,
                      //                 onChanged: (val) {
                      //                   gender = val!;
                      //                   //print(controllerImp.gender.text);
                      //                 },
                      //                 activeColor: AppColor.primaryColor,
                      //                 fillColor: MaterialStateProperty.all(
                      //                     AppColor.primaryColor),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //     Expanded(
                      //       child: Text(
                      //         ": الجنس",
                      //         style: TextStyle(
                      //           fontSize: 15,
                      //           fontWeight: FontWeight.bold,
                      //           //color: tPurple
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      CustomButtomAuth(
                        onPressed: () {
                          controllerImp.signUp();
                        },
                        text: "سجل حساب جديد",
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomTextSignUpOrLogin(
                        textOne: " لديك حساب؟",
                        textTow: "!سجل دخولك",
                        onTap: () {
                          controllerImp.goToSignIn();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
