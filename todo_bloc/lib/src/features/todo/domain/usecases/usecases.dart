import 'package:todo_bloc/src/features/todo/domain/repositories/task_repository.dart';

import '../entities/task.dart';

class AddTask {
  final TaskRepository repository;

  AddTask(this.repository);

  Future<void> call(TaskEntity task) => repository.addTask(task);
}

class UpdateTask {
  final TaskRepository repository;

  UpdateTask(this.repository);

  Future<void> call(TaskEntity task) => repository.updateTask(task);
}

class DeleteTask {
  final TaskRepository repository;

  DeleteTask(this.repository);

  Future<void> call(String id) => repository.deleteTask(id);
}

class GetTasks {
  final TaskRepository repository;

  GetTasks(this.repository);

  Future<List<TaskEntity>> call() => repository.getTasks();
}
