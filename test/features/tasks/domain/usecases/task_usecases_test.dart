import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo/core/error/failure.dart';
import 'package:todo/features/task/domain/entities/task_entity.dart';
import 'package:todo/features/task/domain/usecases/usecase_int_export.dart';

import '../../../../helpers/mocks.mocks.dart';

void main() {
  late MockTaskRepository mockTaskRepository;
  late CreateTaskUseCase createTaskUseCase;
  late DeleteTaskUseCase deleteTaskUseCase;
  late GetAllTasksUseCase getAllTasksUseCase;
  late UpdateTasksUseCase updateTasksUseCase;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    createTaskUseCase = CreateTaskUseCase(mockTaskRepository);
    deleteTaskUseCase = DeleteTaskUseCase(mockTaskRepository);
    getAllTasksUseCase = GetAllTasksUseCase(mockTaskRepository);
    updateTasksUseCase = UpdateTasksUseCase(mockTaskRepository);
  });

  final testTask = TaskEntity(
    id: 1,
    title: "Test Task",
    isCompleted: false,
    date: DateTime.now(),
  );
  final testTasks = [testTask];

  group('CreateTaskUseCase', () {
    test('should return TaskEntity on success', () async {
      // Arrange
      when(mockTaskRepository.createTask(testTask))
          .thenAnswer((_) async => Right(testTask));

      // Act
      final result = await createTaskUseCase(testTask);

      // Assert
      expect(result, Right(testTask));
      verify(mockTaskRepository.createTask(testTask));
      verifyNoMoreInteractions(mockTaskRepository);
    });

    test('should return Failure on error', () async {
      // Arrange
      when(mockTaskRepository.createTask(testTask))
          .thenAnswer((_) async => const Left(ServerFailure()));

      // Act
      final result = await createTaskUseCase(testTask);

      // Assert
      expect(result, const Left(ServerFailure()));
    });
  });

  group('DeleteTaskUseCase', () {
    test('should return void on success', () async {
      // Arrange
      when(mockTaskRepository.deleteTask(1))
          .thenAnswer((_) async => const Right(null));

      // Act
      final result = await deleteTaskUseCase(1);

      // Assert
      expect(result, const Right(null));
      verify(mockTaskRepository.deleteTask(1));
    });

    test('should return Failure on error', () async {
      // Arrange
      when(mockTaskRepository.deleteTask(1))
          .thenAnswer((_) async => const Left(ServerFailure()));

      // Act
      final result = await deleteTaskUseCase(1);

      // Assert
      expect(result, const Left(ServerFailure()));
    });
  });

  group('GetAllTasksUseCase', () {
    test('should return List<TaskEntity> on success', () async {
      // Arrange
      when(mockTaskRepository.getAllTasks())
          .thenAnswer((_) async => Right(testTasks));

      // Act
      final result = await getAllTasksUseCase(null);

      // Assert
      expect(result, Right(testTasks));
      verify(mockTaskRepository.getAllTasks());
    });

    test('should return Failure on error', () async {
      // Arrange
      when(mockTaskRepository.getAllTasks())
          .thenAnswer((_) async => const Left(ServerFailure()));

      // Act
      final result = await getAllTasksUseCase(null);

      // Assert
      expect(result, const Left(ServerFailure()));
    });
  });

  group('UpdateTasksUseCase', () {
    test('should return List<TaskEntity> on success', () async {
      // Arrange
      when(mockTaskRepository.updateTask(testTask))
          .thenAnswer((_) async => Right(testTasks));

      // Act
      final result = await updateTasksUseCase(testTask);

      // Assert
      expect(result, Right(testTasks));
      verify(mockTaskRepository.updateTask(testTask));
    });

    test('should return Failure on error', () async {
      // Arrange
      when(mockTaskRepository.updateTask(testTask))
          .thenAnswer((_) async => const Left(ServerFailure()));

      // Act
      final result = await updateTasksUseCase(testTask);

      // Assert
      expect(result, const Left(ServerFailure()));
    });
  });
}
