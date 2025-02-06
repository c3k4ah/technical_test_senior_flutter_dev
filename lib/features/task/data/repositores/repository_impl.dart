import 'package:dartz/dartz.dart';
import 'package:objectbox/objectbox.dart';
import 'package:todo/core/error/failure.dart';

import '../../domain/entities/task_entity.dart';
import '../../domain/repository/task_repository.dart';
import '../datasources/local/local_data_source.dart';
import '../models/task_model.dart';

class TaskRepositoryImpl implements TaskRepository {
  final LocalDataSource localDataSource;

  TaskRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, TaskEntity>> createTask(TaskEntity task) async {
    try {
      final res = await localDataSource.createTask(TaskModel.fromEntity(task));

      return Right(res.toEntity());
    } on ObjectBoxException catch (e) {
      return Left(ObjectBoxRequestFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTask(int id) async {
    try {
      final res = await localDataSource.deleteTask(id);

      return Right(res);
    } on ObjectBoxException catch (e) {
      return Left(ObjectBoxRequestFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getAllTasks() async {
    try {
      final res = await localDataSource.getAllTasks();
      List<TaskEntity> taskList = res.map((e) => e.toEntity()).toList();
      return Right(taskList);
    } on ObjectBoxException catch (e) {
      return Left(ObjectBoxRequestFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> updateTask(TaskEntity task) async {
    try {
      final res = await localDataSource.updateTask(TaskModel.fromEntity(task));
      List<TaskEntity> taskList = res.map((e) => e.toEntity()).toList();
      return Right(taskList);
    } on ObjectBoxException catch (e) {
      return Left(ObjectBoxRequestFailure(message: e.message));
    }
  }
}
