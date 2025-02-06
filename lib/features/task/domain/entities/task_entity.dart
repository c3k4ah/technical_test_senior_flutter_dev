import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final int id;
  final String? title;
  final DateTime date;
  final bool? isCompleted;

  const TaskEntity({
    required this.id,
    required this.date,
    this.title,
    this.isCompleted,
  });

  TaskEntity copyWith({
    int? id,
    String? title,
    DateTime? date,
    bool? isCompleted,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [
        title,
        date,
        isCompleted,
        id,
      ];

  @override
  String toString() {
    return title ?? "";
  }
}
