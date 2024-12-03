import '../../domain/entities/task.dart';

abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<TaskEntity> tasks;

  TodoLoaded(this.tasks);
}

class TodoError extends TodoState {
  final String message;

  TodoError(this.message);
}
