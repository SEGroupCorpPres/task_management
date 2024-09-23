// main.dart
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/app/presentation/app/app_bloc.dart';
import 'package:task_management/app/presentation/pages/intro_screen.dart';
import 'package:task_management/features/presentation/pages/home_page.dart';
import 'package:task_management/features/presentation/pages/project_tasks_screen.dart';

class AppFlow extends StatelessWidget {
  const AppFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return FlowBuilder<AppState>(
          state: state,
          onGeneratePages: onGenerateAuthPages,
        );
      },
    );
  }
}

List<Page> onGenerateAuthPages(AppState state, List<Page> pages) {
  switch (state.status) {
    case AppStatus.homeScreen:
      return [HomePage.page()];
    case AppStatus.projectTaskListScreen:
      return [ProjectTasksScreen.page()];
    default:
      return [IntroScreen.page()];
  }
}
