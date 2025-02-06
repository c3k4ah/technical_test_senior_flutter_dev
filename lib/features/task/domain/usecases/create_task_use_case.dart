import 'usecases_ext_export.dart';

class CreateTaskUseCase extends UseCase<TaskEntity, TaskEntity> {
  final TaskRepository domainRepo;

  CreateTaskUseCase(this.domainRepo);

  @override
  Future<Either<Failure, TaskEntity>> call(TaskEntity params) async {
    return await domainRepo.createTask(params);
  }
}
