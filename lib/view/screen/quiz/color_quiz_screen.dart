import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/controller/quiz/quiz_color_controller.dart';
import 'package:wahid/controller/quiz/quiz_controller.dart';
import 'package:wahid/core/constant/color.dart';
import 'package:wahid/view/screen/quiz/quiz_card.dart';

import 'quizC_card.dart';

class ColorQuiz extends StatelessWidget {
  const ColorQuiz({super.key});
  @override
  Widget build(BuildContext context) {
    QuizControllerColor _quizController = Get.put(QuizControllerColor());
    QuizControllerColor _controller = Get.put(QuizControllerColor());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: _controller.nextQuiz,
                    child: Text(
                      'Next Quiz',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        _controller.logout();
                      },
                      icon: Icon(Icons.logout_outlined)),
                  Obx(
                    () => Text.rich(
                      TextSpan(
                        text: 'Quiz ${_quizController.quizNum.value}',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: '/${_quizController.quizC.length}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
              color: AppColor.black,
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: _quizController.pageController,
                onPageChanged: _quizController.updateQuiz,
                itemCount: _quizController.quizC.length,
                itemBuilder: (context, index) =>
                    QuizCardC(quizC: _quizController.quizC[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
