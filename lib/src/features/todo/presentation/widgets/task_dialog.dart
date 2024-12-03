import 'package:flutter/material.dart';
import 'package:todo_bloc/src/features/todo/domain/entities/task.dart';
import 'package:todo_bloc/src/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:todo_bloc/src/features/todo/presentation/bloc/todo_event.dart';

class TaskDialog extends StatefulWidget {
  final TodoBloc bloc;
  final TaskEntity? task;

  const TaskDialog({super.key, required this.bloc, this.task});

  @override
  TaskDialogState createState() => TaskDialogState();
}

class TaskDialogState extends State<TaskDialog> {
  late TextEditingController titleEC;
  late TextEditingController descriptionEC;
  late bool isComplete;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    titleEC = TextEditingController(text: widget.task?.title ?? '');
    descriptionEC = TextEditingController(text: widget.task?.description ?? '');
    isComplete = widget.task?.isCompleted ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.task == null ? 'Adicionar Task' : 'Editar Task'),
      content: Form(
        key: _formKey, 
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: titleEC,
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Título não pode ser vazio';
                }
                return null;
              },
            ),
            TextField(
              controller: descriptionEC,
              decoration: const InputDecoration(
                labelText: 'Descrição',
              ),
            ),
            if (widget.task != null)
              Row(
                children: [
                  Checkbox(
                    value: isComplete,
                    onChanged: (value) {
                      setState(() {
                        isComplete = value ?? false;
                      });
                    },
                  ),
                  const Text('Completa'),
                ],
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              if (widget.task == null) {
                final newTask = TaskEntity(
                  id: DateTime.now().toString(),
                  title: titleEC.text,
                  description: descriptionEC.text,
                  isCompleted: isComplete,
                );
                widget.bloc.dispatch(AddTaskEvent(newTask));
              } else {
                final updatedTask = TaskEntity(
                  id: widget.task!.id,
                  title: titleEC.text,
                  description: descriptionEC.text,
                  isCompleted: isComplete,
                );
                widget.bloc.dispatch(UpdateTaskEvent(updatedTask));
              }
              Navigator.of(context).pop();
            }
          },
          child: const Text('Salvar'),
        ),
      ],
    );
  }
}
