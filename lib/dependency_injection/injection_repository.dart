part of 'injections.dart';

void repositories() {
  getIt
      .registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl(getIt()));
}
