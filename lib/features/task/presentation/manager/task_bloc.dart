import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/usecase/usecase.dart';

import '../../domain/entities/task_entity.dart';
import '../../domain/usecases/usecase_int_export.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final CreateTaskUseCase createTaskUseCase;
  final UpdateTasksUseCase updateTasksUseCase;
  final DeleteTaskUseCase deleteTaskUseCase;
  final GetAllTasksUseCase getAllTasksUseCase;

  TaskBloc(
    this.getAllTasksUseCase,
    this.deleteTaskUseCase,
    this.createTaskUseCase,
    this.updateTasksUseCase,
  ) : super(const TaskInitialState()) {
    on<InitTaskDataEvent>(_onInitApp);
    on<ModifyOneTaskEvent>(_onModifyTask);
    on<DeleteTaskEvent>(_onDeleteTask);
    on<CreateTaskEvent>(_onCreateTask);
  }

  Future<void> _onInitApp(
      InitTaskDataEvent event, Emitter<TaskState> emit) async {
    emit(state.copyWith(status: TaskStatus.loading, taskList: []));

    final result = await getAllTasksUseCase(NoParams());

    result.fold(
      (l) {
        emit(state.copyWith(
          status: TaskStatus.error,
          errorMessage: l.message,
        ));
      },
      (r) {
        List<TaskEntity> reorderList = r;
        reorderList.sort((a, b) => b.date.compareTo(a.date));
        emit(
          state.copyWith(
            status: TaskStatus.done,
            taskList: List.of(reorderList),
          ),
        );
      },
    );
  }

  Future<void> _onModifyTask(
      ModifyOneTaskEvent event, Emitter<TaskState> emit) async {
    emit(state.copyWith(status: TaskStatus.loading, taskList: []));
    final result = await updateTasksUseCase(event.task);

    result.fold(
      (l) {
        emit(state.copyWith(
          status: TaskStatus.error,
          errorMessage: l.message,
        ));
      },
      (r) {
        add(InitTaskDataEvent());
      },
    );
  }

  Future<void> _onDeleteTask(
      DeleteTaskEvent event, Emitter<TaskState> emit) async {
    emit(state.copyWith(status: TaskStatus.loading));
    final result = await deleteTaskUseCase(event.id);

    result.fold(
      (l) {
        emit(state.copyWith(
          status: TaskStatus.error,
          errorMessage: l.message,
        ));
      },
      (r) {
        List<TaskEntity> reorderList = state.taskList ?? [];
        reorderList.removeWhere((element) => element.id == event.id);
        emit(
          state.copyWith(
            status: TaskStatus.done,
            taskList: List.of(reorderList),
          ),
        );
      },
    );
  }

  Future<void> _onCreateTask(
      CreateTaskEvent event, Emitter<TaskState> emit) async {
    emit(state.copyWith(status: TaskStatus.loading));

    final result = await createTaskUseCase(event.task);
    result.fold(
      (l) {
        emit(state.copyWith(
          status: TaskStatus.error,
          errorMessage: l.message,
        ));
      },
      (createdTask) {
        List<TaskEntity> reorderList = state.taskList ?? [];

        reorderList.add(createdTask);
        reorderList.sort((a, b) => b.date.compareTo(a.date));

        emit(
          state.copyWith(
            status: TaskStatus.done,
            taskList: reorderList,
          ),
        );
      },
    );
  }
}
