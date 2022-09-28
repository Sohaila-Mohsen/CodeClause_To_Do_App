import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String? title;
  String? description;
  Timestamp? date;
  bool? isDone;
  String? taskId;

  Task(
      {this.title,
      this.description,
      this.date,
      this.isDone = false,
      this.taskId});

  Task.fromJson(Map<String, dynamic> json, this.taskId) {
    title = json['title'];
    print("done11");
    description = json['description'];
    print("done12");
    date = json['date'];
    print("done13+$taskId");
    isDone = json['isDone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    print("done1");
    data['description'] = this.description;
    print("done2");
    data['date'] = this.date;
    print("done3");
    data['isDone'] = this.isDone;
    print("done");
    return data;
  }
}
