import 'usecases_ext_export.dart';

class DeleteTaskUseCase extends UseCase<void, int> {
  final TaskRepository domainRepo;

  DeleteTaskUseCase(this.domainRepo);

  @override
  Future<Either<Failure, void>> call(int params) async {
    return await domainRepo.deleteTask(params);
  }
}
