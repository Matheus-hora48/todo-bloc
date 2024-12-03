import 'package:flutter/material.dart';
import 'package:todo_bloc/src/features/todo/presentation/widgets/task_dialog.dart';
import '../../domain/entities/task.dart';
import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';
import 'task_item_widget.dart';

class TaskListWidget extends StatelessWidget {
  final List<TaskEntity> tasks;
  final TodoBloc bloc;

  const TaskListWidget({
    super.key,
    required this.tasks,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return InkWell(
          onTap: () => _showTaskDialog(context, bloc, task),
          child: TaskItemWidget(
            task: task,
            onDelete: () => bloc.dispatch(DeleteTaskEvent(task.id)),
          ),
        );
      },
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
