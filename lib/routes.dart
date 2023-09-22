import 'package:get/get.dart';
// import 'package:path/path.dart';
// import 'package:wahid/controller/Auth/verify_code_signup_controller.dart';
import 'package:wahid/core/constant/name_routes.dart';
import 'package:wahid/core/middleware/my_middleware.dart';
//import 'package:wahid/test/test.dart';
import 'package:wahid/view/screen/auth/forgetPassword/forgetpassword.dart';
import 'package:wahid/view/screen/auth/login.dart';
import 'package:wahid/view/screen/auth/forgetPassword/reset_password.dart';
import 'package:wahid/view/screen/auth/sign_up.dart';
import 'package:wahid/view/screen/auth/forgetPassword/success_reset_password.dart';
import 'package:wahid/view/screen/auth/success_signup.dart';
import 'package:wahid/view/screen/auth/forgetPassword/verify_code.dart';
import 'package:wahid/view/screen/cours/alphabit.dart';
import 'package:wahid/view/screen/cours/colors.dart';
import 'package:wahid/view/screen/cours_screen.dart';
import 'package:wahid/view/screen/home_screen.dart';
import 'package:wahid/view/screen/onboarding.dart';
import 'package:wahid/view/screen/quiz/alphabit_quiz_screen.dart';

import 'view/screen/auth/verify_code_singup.dart';
import 'view/screen/quiz/color_quiz_screen.dart';

//import 'view/test_view.dart';

List<GetPage<dynamic>>? routes = [
  // Auth
  GetPage(name: "/", page: () => OnBoarding(), middlewares: [MyMiddleware()]),
  //GetPage(name: "/", page: () => TestView()),
  GetPage(name: AppNameRoute.login, page: () => Login()),
  GetPage(name: AppNameRoute.signUp, page: () => SignUp()),
  GetPage(name: AppNameRoute.forgetPassword, page: () => ForgetPassword()),
  GetPage(name: AppNameRoute.verfiyCode, page: () => VerfiyCode()),
  GetPage(name: AppNameRoute.resetPassword, page: () => ResetPassword()),
  GetPage(
      name: AppNameRoute.successResetPassword,
      page: () => SuccessResetPassword()),
  GetPage(name: AppNameRoute.successSignUp, page: () => SuccessSignUp()),
  GetPage(name: AppNameRoute.verfiyCodeSignUp, page: () => VerfiyCodeSignUp()),
  GetPage(name: AppNameRoute.home, page: () => HomeScreen()),
  GetPage(name: AppNameRoute.color, page: () => ColorScreen()),
  GetPage(name: AppNameRoute.alphabit, page: () => AlphabitScreen()),
  GetPage(name: AppNameRoute.QuizAlphapit, page: () => AlphabitQuiz()),
  GetPage(name: AppNameRoute.QuizColor, page: () => ColorQuiz()),
  GetPage(name: AppNameRoute.cours, page: () => CoursScreen()),
];
