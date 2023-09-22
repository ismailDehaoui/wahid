import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/controller/quiz/quiz_controller.dart';
import 'package:wahid/data/model/quizModel.dart';
import 'package:wahid/view/screen/quiz/optional.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({super.key, required this.quizC});

  final Quiz quizC;

  @override
  Widget build(BuildContext context) {
    QuizControllerImage _controller = Get.put(QuizControllerImage());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              quizC.quiz!,
              //height: 300,
              //width: 300,
            ),
            Text(
              quizC.ask!,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
              children: [
                ...List.generate(quizC.optional!.length, (index) {
                  return Container(
                    //height: 110,
                    child: Optional(
                      index: index,
                      image: quizC.optional![index],
                      press: () =>
                          _controller.correctAns(quizC, index, context),
                    ),
                  );
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
