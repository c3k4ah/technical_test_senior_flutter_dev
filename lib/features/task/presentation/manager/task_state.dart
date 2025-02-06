part of 'task_bloc.dart';

enum TaskStatus {
  loading,
  error,
  done,
  initial,
}

class TaskState extends Equatable {
  final TaskStatus status;
  final List<TaskEntity>? taskList;
  final String? errorMessage;

  const TaskState({
    required this.status,
    this.taskList,
    this.errorMessage,
  });

  TaskState copyWith({
    TaskStatus? status,
    List<TaskEntity>? taskList,
    String? errorMessage,
  }) {
    return TaskState(
      status: status ?? this.status,
      taskList: taskList ?? this.taskList,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        taskList,
        errorMessage,
      ];
}

class TaskInitialState extends TaskState {
  const TaskInitialState({
    super.status = TaskStatus.initial,
    super.taskList = const [],
  });
}

List<TaskEntity> defaultTaskList = [
  // TaskEntity(
  //   id: "id1",
  //   title: "Deploy app",
  //   date: DateTime(2024, 01, 27),
  //   isCompleted: false,
  // ),
  // TaskEntity(
  //   idEntity: "id2",
  //   title: "Add signup feature",
  //   date: DateTime.now(),
  //   isCompleted: true,
  // ),
  // TaskEntity(
  //   idEntity: "id3",
  //   title: "Add user",
  //   date: DateTime(2024, 01, 17),
  //   isCompleted: true,
  // ),
];
