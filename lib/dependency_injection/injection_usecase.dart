part of 'injections.dart';

void usecases() {
  getIt.registerLazySingleton<CreateTaskUseCase>(
      () => CreateTaskUseCase(getIt()));
  getIt.registerLazySingleton<UpdateTasksUseCase>(
      () => UpdateTasksUseCase(getIt()));
  getIt.registerLazySingleton<DeleteTaskUseCase>(
      () => DeleteTaskUseCase(getIt()));
  getIt.registerLazySingleton<GetAllTasksUseCase>(
      () => GetAllTasksUseCase(getIt()));
}
