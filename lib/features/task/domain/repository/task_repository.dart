import 'package:dartz/dartz.dart';
import 'package:todo/core/error/failure.dart';

import '../entities/task_entity.dart';

abstract class TaskRepository {
  Future<Either<Failure, TaskEntity>> createTask(TaskEntity task);
  Future<Either<Failure, List<TaskEntity>>> updateTask(TaskEntity task);
  Future<Either<Failure, List<TaskEntity>>> getAllTasks();
  Future<Either<Failure, void>> deleteTask(int id);
}
