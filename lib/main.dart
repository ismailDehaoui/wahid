import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/binding/initial_binding.dart';
import 'package:wahid/core/constant/color.dart';
import 'package:wahid/core/localization/translaition.dart';
import 'package:wahid/core/services/services.dart';
import 'package:wahid/routes.dart';
import 'package:wahid/view/screen/quiz_page/quiz_screen.dart';

import 'ismail.dart';
//import 'package:wahid/test/test.dart';
//import 'package:wahid/view/screen/onboarding.dart';

void mai() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
            color: AppColor.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Cairo",
          ),
          headline2: TextStyle(
            color: AppColor.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: "Cairo",
          ),
          bodyText1: TextStyle(
            height: 2,
            color: AppColor.grey,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            // fontFamily: "Cairo",
          ),
          bodyText2: TextStyle(
            height: 2,
            color: const Color.fromARGB(255, 227, 146, 146),
            fontSize: 14,
            // fontFamily: "Cairo",
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 7, 161, 244)),
        useMaterial3: true,
      ),
      // initialBinding: InitialBindings(),
      home: Ismail(), //Test(),
      //routes: routes,
      getPages: routes,
    );
  }
}
