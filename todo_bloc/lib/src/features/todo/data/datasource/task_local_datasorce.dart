import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_bloc/src/core/utils/constants.dart';
import 'package:todo_bloc/src/features/todo/data/models/task_model.dart';
import 'dart:convert';

class TaskLocalDatasorce {
  Future<List<TaskModel>> getTasks() async {
    final sp = await SharedPreferences.getInstance();
    
    final data = sp.getString(Constants.kSharedPreferencesKey);
    if (data == null) return [];
    final List<dynamic> jsonList = jsonDecode(data);
    return jsonList.map((e) => TaskModel.fromJson(e)).toList();
  }

  Future<void> saveTasks(List<TaskModel> tasks) async {
    final sp = await SharedPreferences.getInstance();

    final jsonList = tasks.map((e) => e.toJson()).toList();
    await sp.setString(
      Constants.kSharedPreferencesKey,
      jsonEncode(jsonList),
    );
  }
}
