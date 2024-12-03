import '../../domain/entities/task.dart';

abstract class TodoEvent {}

class AddTaskEvent extends TodoEvent {
  final TaskEntity task;

  AddTaskEvent(this.task);
}

class UpdateTaskEvent extends TodoEvent {
  final TaskEntity task;

  UpdateTaskEvent(this.task);
}

class DeleteTaskEvent extends TodoEvent {
  final String taskId;

  DeleteTaskEvent(this.taskId);
}

class LoadTasksEvent extends TodoEvent {}
