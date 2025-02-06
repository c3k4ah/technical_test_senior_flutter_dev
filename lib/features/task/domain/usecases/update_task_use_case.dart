import 'usecases_ext_export.dart';

class UpdateTasksUseCase extends UseCase<List<TaskEntity>, TaskEntity> {
  final TaskRepository domainRepo;

  UpdateTasksUseCase(this.domainRepo);

  @override
  Future<Either<Failure, List<TaskEntity>>> call(TaskEntity params) async {
    return await domainRepo.updateTask(params);
  }
}
