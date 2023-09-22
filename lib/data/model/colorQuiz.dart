class ColorQuizModel {
  final int? id, answer;
  final String? quiz, ask;
  final List<String>? optional;

  ColorQuizModel({this.id, this.quiz, this.ask, this.optional, this.answer});
}

const List quiz_exame = [
  {
    'id': 1,
    'quiz': 'assets/images/colors/triangle.png',
    'ask': ' أين هوالمثلث الأحمر؟',
    'optional': [
      'assets/images/colors/triangle-red.png',
      'assets/images/colors/triangle-green.png',
      'assets/images/colors/triangle-blue.png',
      'assets/images/colors/triangle-yallow.png',
    ],
    'answer': 0,
  },
  {
    'id': 2,
    'quiz': 'assets/images/colors/circle.png',
    'ask': ' أين هي الدائرة الزرقاء؟',
    'optional': [
      'assets/images/colors/circle-yallow.png',
      'assets/images/colors/circle-red.png',
      'assets/images/colors/circle-green.png',
      'assets/images/colors/circle-blue.png',
    ],
    'answer': 3,
  },
  {
    'id': 3,
    'quiz': 'assets/images/colors/rectangular.png',
    'ask': ' أين هو المستطيل الأخضر؟',
    'optional': [
      'assets/images/colors/rectangular-blue.png',
      'assets/images/colors/rectangular-yallow.png',
      'assets/images/colors/rectangular-green.png',
      'assets/images/colors/rectangular-red.png',
    ],
    'answer': 2,
  },
  {
    'id': 4,
    'quiz': 'assets/images/colors/star.png',
    'ask': ' أين هي النجمة الصفراء؟',
    'optional': [
      'assets/images/colors/star-yallow.png',
      'assets/images/colors/star-red.png',
      'assets/images/colors/star-blue.png',
      'assets/images/colors/star-green.png',
    ],
    'answer': 0,
  },
  {
    'id': 5,
    'quiz': 'assets/images/colors/rectangular.png',
    'ask': ' أين هو المستطيل الأحمر',
    'optional': [
      'assets/images/colors/rectangular-blue.png',
      'assets/images/colors/rectangular-yallow.png',
      'assets/images/colors/rectangular-green.png',
      'assets/images/colors/rectangular-red.png',
    ],
    'answer': 3,
  },
];
