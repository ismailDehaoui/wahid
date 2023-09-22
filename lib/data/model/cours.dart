class Cours {
  String name;
  String duration;
  bool isPlaying;
  bool isCompleted;

  Cours(
      {required this.duration,
      required this.isCompleted,
      required this.isPlaying,
      required this.name});

  List<Cours> coursList = [
    Cours(
        duration: '1 min 20 ses',
        isCompleted: true,
        isPlaying: true,
        name: "اللون الأحمر"),
    Cours(
        duration: '1 min 20 ses',
        isCompleted: false,
        isPlaying: false,
        name: "اللون الأزرق"),
    Cours(
        duration: '1 min 20 ses',
        isCompleted: false,
        isPlaying: true,
        name: "اللون الأصفر"),
  ];
}
