class TodoModel {
  final int id;
  final String title;
  final String desc;
  final bool isDone;

  TodoModel({
    required this.id,
    this.title = "ikiw",
    required this.desc,
    this.isDone = false
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] as int, 
      title: json['title'], 
      desc: json['desc'], 
      isDone: json['is_done']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title' : title,
      'desc' : desc,
      'is_done' : isDone
    };
  }
}