class Todo {
  final int id;
  final String title;
  final bool completed;

  Todo({
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json["id"],
      title: json["title"],
      completed: json["completed"],
    );
  }

  Map toJson() {
    return {
      "id": id,
      "title": title,
      "completed": completed,
    };
  }
}
