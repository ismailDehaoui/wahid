class Quiz {
  final int? id, answer;
  final String? quiz, ask;
  final List<String>? optional;

  Quiz({this.id, this.quiz, this.ask, this.optional, this.answer});
}

const List quiz_exam = [
  {
    'id': 1,
    'quiz': 'assets/images/animals/pets.png',
    'ask': ' أين هو الحيوان الذي يبدأ بحرف الألف؟',
    'optional': [
      'assets/images/animals/sheep.png',
      'assets/images/animals/cat.png',
      'assets/images/animals/rabbit.png',
      'assets/images/animals/duck.png',
    ],
    'answer': 2,
  },
  {
    'id': 2,
    'quiz': 'assets/images/fruits/fruit-A.png',
    'ask': ' أين هي الفاكهة التي تبدأ بحرف الباء ؟',
    'optional': [
      'assets/images/fruits/strawberry.png',
      'assets/images/fruits/watermelon.png',
      'assets/images/fruits/banane.png',
      'assets/images/fruits/appel.png',
    ],
    'answer': 1,
  },
  {
    'id': 3,
    'quiz': 'assets/images/things/thing.png',
    'ask': ' ما هو الشيئ الذي يبدأ بحرف التاء؟',
    'optional': [
      'assets/images/things/BICYCLE.png',
      'assets/images/things/taj.png',
      'assets/images/things/BAG.png',
      'assets/images/things/BALL.png',
    ],
    'answer': 1,
  },
  {
    'id': 4,
    'quiz': 'assets/images/animals/predators.png',
    'ask': ' أي هذه الحيوانات تبدأ بحرف الثاء؟',
    'optional': [
      'assets/images/animals/fox.png',
      'assets/images/animals/tiger.png',
      'assets/images/animals/bear.png',
      'assets/images/animals/lion.png',
    ],
    'answer': 0,
  },
  {
    'id': 5,
    'quiz': 'assets/images/fruits/fruit-C.png',
    'ask': ' أي هذه الخضروات تبدأ بحرف الجيم؟',
    'optional': [
      'assets/images/fruits/tomatoes.png',
      'assets/images/fruits/eggplant.png',
      'assets/images/fruits/carrot.png',
      'assets/images/fruits/potato.png',
    ],
    'answer': 2,
  },
];
