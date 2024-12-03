import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:todo_bloc/src/features/todo/presentation/todo_route.dart';

class TodoModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => '/';

  @override
  Map<String, WidgetBuilder> get pages => {'/': (context) => const TodoRoute()};
}
