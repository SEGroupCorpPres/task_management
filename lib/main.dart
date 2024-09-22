import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl_standalone.dart';
import 'package:task_management/app/app.dart';
import 'package:task_management/core/observer/bloc_observer.dart';
import 'package:task_management/features/data/repositories/task_repository_impl.dart';

Future<void> main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  final TaskRepositoryImpl taskRepositoryImpl = TaskRepositoryImpl();
  await findSystemLocale();
  runApp(
    App(
      taskRepositoryImpl: taskRepositoryImpl,
    ),
  );
}
