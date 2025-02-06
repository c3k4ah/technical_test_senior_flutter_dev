import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo/core/source/local/local_source.dart';

import '../core/source/local/local_source_impl.dart';
import '../core/source/remote/remote_source.dart';
import '../core/source/remote/remote_source_impl.dart';
import '../features/task/data/datasources/local/local_data_source.dart';
import '../features/task/data/datasources/local/local_data_source_impl.dart';
import '../features/task/data/models/task_model.dart';
import '../features/task/data/repositores/repository_impl.dart';
import '../features/task/domain/repository/task_repository.dart';
import '../features/task/domain/usecases/usecase_int_export.dart';
import '../features/task/presentation/manager/task_bloc.dart';
import '../objectbox.g.dart';

part 'bloc_injections.dart';
part 'injection_datasource.dart';
part 'injection_repository.dart';
part 'injection_usecase.dart';

final getIt = GetIt.instance;

Future<void> initInjection() async {
  blocs();
  datasources();
  usecases();
  repositories();
  await service();
}

Future<void> service() async {
  final dio = Dio(
    BaseOptions(
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    ),
  );

  getIt.registerSingleton(dio);
  getIt.registerLazySingleton<RemoteSource>(() => RemoteSourceImpl(dio));

  final Store store = await initStore();
  getIt.registerLazySingleton<LocalSource<TaskModel>>(
      () => LocalSourceImpl(store.box()));
}

void externalResources() {}

Future<Store> initStore() async {
  final dir = await getApplicationDocumentsDirectory();
  return openStore(directory: "${dir.path}/task-db");
}
