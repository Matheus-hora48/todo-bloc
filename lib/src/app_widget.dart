import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:todo_bloc/src/core/binding/app_binding.dart';
import 'package:todo_bloc/src/features/todo/presentation/todo_module.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      bindings: AppBinding(),
      modules: [
        TodoModule(),
      ],
      builder: (context, routes, flutterGetItNavObserver) {
        return MaterialApp(
          title: 'Todo App',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
          ),
          debugShowCheckedModeBanner: false,
          routes: routes,
          navigatorObservers: [
            flutterGetItNavObserver,
          ],
        );
      },
    );
  }
}
