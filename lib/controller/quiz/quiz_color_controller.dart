// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/data/model/quizModel.dart';
import 'package:wahid/view/screen/quiz/result.dart';
import 'package:wahid/core/services/services.dart';
import 'package:wahid/core/constant/name_routes.dart';

import '../../data/model/colorQuiz.dart';

class QuizControllerColor extends GetxController
    // ignore: deprecated_member_use
    with
        SingleGetTickerProviderMixin {
  List<ColorQuizModel> _quizC = quiz_exame
      .map(
        (quiz) => ColorQuizModel(
            id: quiz['id'],
            quiz: quiz['quiz'],
            ask: quiz['ask'],
            optional: quiz['optional'],
            answer: quiz['answer']),
      )
      .toList();

  List<ColorQuizModel> get quizC => this._quizC;
  //quizC.shuffle();
  int? _selectAns;
  int get selectAns => this._selectAns!;

  int? _checkAns;
  int get checkAns => this._checkAns!;

  bool _answered = false;
  bool get answered => this._answered;

  PageController? _quizPage;
  PageController get pageController => this._quizPage!;

  RxInt _quizNum = 1.obs;
  RxInt get quizNum => this._quizNum;
  int scores = 0;

  int _numCheckAns = 0;
  int get numcheckAns => this._numCheckAns;
  MyServices myServices = Get.find();
  logout() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppNameRoute.login);
  }

  @override
  void onInit() {
    _quizPage = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _quizPage!.dispose();
  }

  void correctAns(
      ColorQuizModel quiz, int selectedIndex, BuildContext context) {
    _answered = true;
    _checkAns = quiz.answer;
    _selectAns = selectedIndex;
    // final player = AudioCache();
    quizC.shuffle();
    if (_checkAns == _selectAns) {
      _numCheckAns++;
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 3000),
        backgroundColor: Colors.green,
        content: Text("!أحسنت"),
      );
      //player.play("audios/sahiha.mp3");
      scores += 20;
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else {
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 3000),
        backgroundColor: Colors.red,
        content: Text("!خطــــــأ"),
      );
      //player.play("audios/khatiaa.mp3");
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
    update();

    Future.delayed(Duration(seconds: 2), () {
      nextQuiz();
    });
  }

  void nextQuiz() {
    if (_quizNum.value != _quizC.length) {
      print('U r in if of nextQuiz');
      _answered = false;
      _quizPage?.nextPage(
          duration: Duration(microseconds: 250), curve: Curves.fastOutSlowIn);
    } else {
      print("U r in else of nextQuiz");
      Get.to(() => result(
            h: numcheckAns,
            marks: scores,
          ));
    }
  }

  void updateQuiz(int index) {
    _quizNum.value = index + 1;
  }
}
