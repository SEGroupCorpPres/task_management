import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/theme.dart';
import 'package:task_management/features/data/repositories/task_repository_impl.dart';
import 'package:task_management/features/domain/use_cases/use_cases.dart';
import 'package:task_management/features/presentation/bloc/task/task_bloc.dart';
import 'package:task_management/features/presentation/pages/home_page.dart';

class App extends StatelessWidget {
  final TaskRepositoryImpl taskRepositoryImpl;

  const App({super.key, required this.taskRepositoryImpl});

  // final AppTheme theme = AppTheme();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TaskBloc(
            getTasks: GetTasks(taskRepositoryImpl),
            createTask: CreateTask(taskRepositoryImpl),
            updateTask: UpdateTask(taskRepositoryImpl),
            deleteTask: DeleteTask(taskRepositoryImpl),
            getTaskById: GetTaskById(taskRepositoryImpl),
          ),
        )
      ],
      child: ScreenUtilInit(
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: ThemeMode.light,
            theme: lightTheme,
            home: child,
            // localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            //   GlobalWidgetsLocalizations.delegate,
            //   ...GlobalMaterialLocalizations.delegates,
            //   ...GlobalCupertinoLocalizations.delegates,
            // ],
          );
        },
        // child: IntroScreen(),
        child: HomePage(),
      ),
    );
  }
}
