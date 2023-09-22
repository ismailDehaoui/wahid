import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/controller/quiz/quiz_color_controller.dart';
import 'package:wahid/core/constant/color.dart';

class Op extends StatelessWidget {
  const Op({
    super.key,
    this.image,
    this.index,
    this.press,
  });
  final String? image;
  final int? index;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizControllerColor>(
      init: QuizControllerColor(),
      builder: (qnController) {
        Color getRightColor() {
          if (qnController.answered) {
            if (index == qnController.checkAns) {
              return Colors.white;
            } else if (index == qnController.selectAns &&
                qnController.selectAns != qnController.checkAns) {
              return AppColor.primaryColor;
            }
          }
          return AppColor.black;
        }

        return InkWell(
          onTap: press,
          child: Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(color: getRightColor()),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(
              '$image',
              // height: 50,
              // width: 50,
            ),
          ),
        );
      },
    );
  }
}
