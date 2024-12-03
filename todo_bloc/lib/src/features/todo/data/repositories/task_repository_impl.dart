import 'package:todo_bloc/src/features/todo/data/datasource/task_local_datasorce.dart';
import 'package:todo_bloc/src/features/todo/data/models/task_model.dart';
import 'package:todo_bloc/src/features/todo/domain/repositories/task_repository.dart';

import '../../domain/entities/task.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDatasorce dataSource;

  TaskRepositoryImpl(this.dataSource);

  @override
  Future<List<TaskEntity>> getTasks() => dataSource.getTasks();

  @override
  Future<void> addTask(TaskEntity task) async {
    final tasks = await dataSource.getTasks();
    final taskModel = TaskModel(
      id: task.id,
      title: task.title,
      description: task.description,
      isCompleted: task.isCompleted,
    );
    tasks.add(taskModel);
    await dataSource.saveTasks(tasks);
  }

  @override
  Future<void> updateTask(TaskEntity task) async {
    final tasks = await dataSource.getTasks();
    final index = tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      final taskModel = TaskModel(
        id: task.id,
        title: task.title,
        isCompleted: task.isCompleted,
        description: task.description,
      );
      tasks[index] = taskModel;
    }
    await dataSource.saveTasks(tasks);
  }

  @override
  Future<void> deleteTask(String id) async {
    final tasks = await dataSource.getTasks();
    tasks.removeWhere((t) => t.id == id);
    await dataSource.saveTasks(tasks);
  }
}
