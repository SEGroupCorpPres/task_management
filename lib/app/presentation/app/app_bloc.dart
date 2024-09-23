import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/features/data/local/models/category.dart';
import 'package:task_management/features/data/local/models/task.dart';

// Events
part 'app_event.dart';
// States
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState(status: AppStatus.initial)) {
    on<NavigateToHomePage>(_onNavigateHomeScreen);
    on<NavigateToProjectTasksScreen>(_onNavigateProjectTasksScreen);
    on<NavigateToIntroScreen>(_onNavigateIntroScreen);
  }

  void _onNavigateHomeScreen(NavigateToHomePage event, Emitter<AppState> emit) async {
    emit(
      state.copyWith(
        status: AppStatus.homeScreen,
        isEdit: event.isEdit,
        task: event.task,
      ),
    );
  }

  void _onNavigateProjectTasksScreen(NavigateToProjectTasksScreen event, Emitter<AppState> emit) async {
    emit(
      state.copyWith(
        status: AppStatus.projectTaskListScreen,
        category: event.category.name,
      ),
    );
  }

  void _onNavigateIntroScreen(NavigateToIntroScreen event, Emitter<AppState> emit) async {
    emit(
      state.copyWith(
        status: AppStatus.introScreen,
      ),
    );
  }
}
