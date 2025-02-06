import 'usecases_ext_export.dart';

class GetAllTasksUseCase extends UseCase<List<TaskEntity>, void> {
  final TaskRepository domainRepo;

  GetAllTasksUseCase(this.domainRepo);

  @override
  Future<Either<Failure, List<TaskEntity>>> call(void params) async {
    return await domainRepo.getAllTasks();
  }
}
