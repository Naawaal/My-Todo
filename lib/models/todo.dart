class Todo {
  String id;
  String todoTask;
  bool isDone = false;

  Todo({
    required this.id,
    required this.todoTask,
    this.isDone = false,
  });
}
