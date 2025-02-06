import 'package:objectbox/objectbox.dart';

import '../../domain/entities/task_entity.dart';

@Entity()
class TaskModel {
  @Id()
  int id;
  final String? title;
  final DateTime date;
  final bool? isCompleted;
  TaskModel({
    required this.id,
    this.title,
    required this.date,
    this.isCompleted,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json["id"],
      title: json["title"] ?? "",
      date: DateTime.parse(json["date"]),
      isCompleted: json["isCompleted"] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title ?? "",
      "isCompleted": isCompleted ?? false,
      "date": date.toIso8601String(),
    };
  }

  factory TaskModel.fromEntity(TaskEntity entity) {
    return TaskModel(
      id: entity.id,
      title: entity.title,
      date: entity.date,
      isCompleted: entity.isCompleted,
    );
  }

  TaskEntity toEntity() {
    return TaskEntity(
      id: id,
      title: title,
      date: date,
      isCompleted: isCompleted,
    );
  }

  @override
  String toString() {
    return title ?? "";
  }
}
