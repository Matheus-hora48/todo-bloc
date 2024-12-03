import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:todo_bloc/src/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:todo_bloc/src/features/todo/presentation/todo_page.dart';

class TodoRoute extends FlutterGetItModulePageRouter {
  const TodoRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton(
          (i) => TodoBloc(
            addTask: i(),
            updateTask: i(),
            deleteTask: i(),
            getTasks: i(),
          ),
        )
      ];

  @override
  WidgetBuilder get view => (_) => const TodoPage();
}
