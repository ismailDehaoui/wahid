import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/core/constant/color.dart';
import 'package:wahid/core/constant/image_assets.dart';
import 'package:wahid/core/constant/name_routes.dart';

// ignore: must_be_immutable
class result extends StatefulWidget {
  int marks;
  int h;
  result({
    super.key,
    required this.marks,
    required this.h,
  });

  @override
  State<result> createState() => _resultState(marks, h);
}

class _resultState extends State<result> {
  int marks;
  int h;

  _resultState(this.marks, this.h);
  List<String> images = [
    AppImageAsset.bed,
    AppImageAsset.good,
    AppImageAsset.nice
  ];
  String message = "";
  String image = "";

  @override
  void initState() {
    super.initState();
    if (marks < 60) {
      image = images[0];
      message = "يجب أن تعيد درسك و تركز جيدا  \n " + " ${marks} :مجموعك هو";
    } else if (marks < 100) {
      image = images[1];
      message = "يمكنك أن تحصل على أكثر من هذا  \n " +
          " ${marks} :مجموعك هو" +
          "\n انتقل إلى الدرس التالي";
      //QuizeScreen.level = QuizeScreen.level + 1;
    } else {
      image = images[2];
      message = "هذا  ممتاز  تهانينا  لك  لقد إجتزت هذا المستوى بنجاح \n " +
          " ${marks} :مجموعك هو" +
          "\n انتقل إلى الدرس التالي";

      // QuizeScreen.level = QuizeScreen.level + 1;
    }
  }

  // updateRecord(UserModel user) async {
  //   final ap = Provider.of<AuthProvider>(context, listen: false);
  //   await ap.updateUserRecord(user: user);
  // }

  @override
  Widget build(BuildContext context) {
    // final ap = Provider.of<AuthProvider>(context, listen: false);
    // int niveau = ap.userModel.level + 1;
    if (marks == 100 || marks >= 60) {
      //   ap.userModel.level += 1;
      //   final level = UserModel(
      //       firstName: ap.userModel.firstName,
      //       lastName: ap.userModel.lastName,
      //       email: ap.userModel.email,
      //       phone: ap.userModel.phone,
      //       profilePic: ap.userModel.profilePic,
      //       dateOfBirth: ap.userModel.dateOfBirth,
      //       gender: ap.userModel.gender,
      //       level: niveau,
      //       createdAt: ap.userModel.createdAt,
      //       uid: ap.userModel.uid);
      //   updateRecord(level);
    }
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    "الاختر",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    "نتيجة الاختبار",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 20.0,
            // ),
            Container(
              child: Column(
                children: [
                  Material(
                    child: Container(
                      width: 100,
                      height: 100,
                      child: ClipRect(
                        child: Image(
                          image: AssetImage(image),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 10.0,
                    ),
                  ),
                  Center(
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17.0, color: AppColor.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.all(12.0),
            //     child: Center(
            //       child: Text(
            //         "",
            //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 50),
                Flexible(
                  child: Divider(
                    color: Colors.black,
                    height: 2,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                ),
                Text(
                  "نتيجتي",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Flexible(
                  child: Divider(
                    color: Colors.black,
                    height: 2,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                ),
                SizedBox(width: 50),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 50,
                ),
                Text(
                  h.toString(),
                  style: TextStyle(fontSize: 24, color: Colors.green),
                ),
                Text(
                  " :عدد الإجابات الصحيحة",
                  style: TextStyle(color: Colors.greenAccent),
                ),
                Text(" - "),
                Text(
                  (5 - h).toString(),
                  style: TextStyle(fontSize: 24, color: Colors.red),
                ),
                Expanded(
                    child: Text(
                  " :عدد الإجابات الخاطئة",
                  style: TextStyle(color: Colors.redAccent),
                )),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed(AppNameRoute.home);
                  },
                  child: Text(
                    " تابــــــــع",
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
