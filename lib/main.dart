import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_bloc/src/app_widget.dart';

Future<void> main() async {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const AppWidget());
  }, (error, stack) {
    log('Erro não tratado', error: error, stackTrace: stack);
    throw error;
  });
}
