class Task {
  Task({required this.name, required this.isDone});
  final String name;
  bool isDone;
  void toggleDone(){
    isDone = !isDone;
  }
}
