part of 'injections.dart';

void blocs() {
  getIt.registerFactory(
    () => TaskBloc(
      getIt(),
      getIt(),
      getIt(),
      getIt(),
    ),
  );
}
