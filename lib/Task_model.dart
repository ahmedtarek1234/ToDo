class TaskModel {
  String id;
  String title;
  String description;
  bool isDone;
  int date;

  TaskModel({
    this.id = "",
    this.isDone = false,
    required this.description,
    required this.title,
    required this.date,
  });

  TaskModel.fromjson(Map<String, dynamic> json) :this(
      description: json['description'],
      title: json['title'],
      date: json['date'],
      isDone: json['isDone'],
      id: json['id']
  );

  Map<String, dynamic> tojson() {
    return {
      "description": description,
      "title": title,
      "date": date,
      "isDone": isDone,
      "id": id
    };
  }
}