import 'package:todo/features/task/data/models/task_model.dart';

abstract class LocalDataSource {
  Future<TaskModel> createTask(TaskModel task);
  Future<List<TaskModel>> updateTask(TaskModel task);
  Future<List<TaskModel>> getAllTasks();
  Future<void> deleteTask(int id);
}
