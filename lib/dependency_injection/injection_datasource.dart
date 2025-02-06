part of 'injections.dart';

void datasources() {
  getIt.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(
      getIt(),
    ),
  );
}
