import 'package:todo_bloc/src/features/todo/domain/entities/task.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    required super.id,
    required super.title,
    String? description,
    super.isCompleted,
  }) : super(
          description: description ?? '',
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'title': title,
        'isCompleted': isCompleted,
      };

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json['id'],
        description: json['description'],
        title: json['title'],
        isCompleted: json['isCompleted'],
      );
}
