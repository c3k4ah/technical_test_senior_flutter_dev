import 'package:todo/features/task/data/models/task_model.dart';

import '../../../../../core/source/local/local_source.dart';
import 'local_data_source.dart';

class LocalDataSourceImpl implements LocalDataSource {
  final LocalSource<TaskModel> local;

  LocalDataSourceImpl(this.local);
  @override
  Future<TaskModel> createTask(TaskModel task) async {
    await local.insert(task);
    return task;
  }

  @override
  Future<void> deleteTask(int id) async {
    await local.delete(id);
  }

  @override
  Future<List<TaskModel>> getAllTasks() async {
    final result = await local.fetchAll();

    return result;
  }

  @override
  Future<List<TaskModel>> updateTask(TaskModel task) async {
    await local.update(task.id, task);

    return [];
  }
}
