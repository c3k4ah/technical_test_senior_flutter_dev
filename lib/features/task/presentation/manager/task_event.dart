part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateTaskEvent extends TaskEvent {
  final TaskEntity task;

  CreateTaskEvent({required this.task});

  @override
  List<Object?> get props => [task];
}

class GetAllTasksEvent extends TaskEvent {}

class ModifyOneTaskEvent extends TaskEvent {
  final TaskEntity task;

  ModifyOneTaskEvent({required this.task});
  @override
  List<Object?> get props => [task];
}

class DeleteTaskEvent extends TaskEvent {
  final int id;

  DeleteTaskEvent({required this.id});
  @override
  List<Object?> get props => [id];
}

class InitTaskDataEvent extends TaskEvent {}
