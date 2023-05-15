class Todo {
  final String id;
  bool isDone;
  String content;

  Todo({required this.id, this.isDone = false, this.content = ''});

  void toggleDone() {
    isDone = !isDone;
  }
}
