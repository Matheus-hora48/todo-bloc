import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:todo_bloc/src/features/todo/domain/entities/task.dart';
import 'package:todo_bloc/src/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:todo_bloc/src/features/todo/presentation/bloc/todo_state.dart';
import 'package:todo_bloc/src/features/todo/presentation/widgets/empty_state_widget.dart';
import 'package:todo_bloc/src/features/todo/presentation/widgets/task_dialog.dart';
import 'package:todo_bloc/src/features/todo/presentation/widgets/task_list_widget.dart';

import 'bloc/todo_event.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final bloc = Injector.get<TodoBloc>();

  @override
  void initState() {
    super.initState();
    bloc.dispatch(LoadTasksEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List')),
      body: StreamBuilder<TodoState>(
        stream: bloc.state,
        initialData: bloc.initialState,
        builder: (context, snapshot) {
          final state = snapshot.data;

          if (state is TodoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodoLoaded) {
            return state.tasks.isEmpty
                ? const EmptyStateWidget()
                : TaskListWidget(tasks: state.tasks, bloc: bloc);
          } else if (state is TodoError) {
            return Center(child: Text('Error: ${state.message}'));
          }

          return const EmptyStateWidget();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showTaskDialog(context, bloc, null);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showTaskDialog(
    BuildContext context,
    TodoBloc bloc,
    TaskEntity? task,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return TaskDialog(
          bloc: bloc,
          task: task,
        );
      },
    );
  }
}
