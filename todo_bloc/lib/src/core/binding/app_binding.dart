import 'package:flutter_getit/flutter_getit.dart';
import 'package:todo_bloc/src/features/todo/data/datasource/task_local_datasorce.dart';
import 'package:todo_bloc/src/features/todo/data/repositories/task_repository_impl.dart';
import 'package:todo_bloc/src/features/todo/domain/usecases/usecases.dart';

class AppBinding extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() => [
        Bind.lazySingleton((i) => TaskLocalDatasorce()),
        Bind.lazySingleton((i) => TaskRepositoryImpl(i<TaskLocalDatasorce>())),
        Bind.lazySingleton((i) => AddTask(i<TaskRepositoryImpl>())),
        Bind.lazySingleton((i) => GetTasks(i<TaskRepositoryImpl>())),
        Bind.lazySingleton((i) => UpdateTask(i<TaskRepositoryImpl>())),
        Bind.lazySingleton((i) => DeleteTask(i<TaskRepositoryImpl>())),
      ];
}
