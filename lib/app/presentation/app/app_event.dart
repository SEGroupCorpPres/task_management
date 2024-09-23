part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}


class NavigateToHomePage extends AppEvent {
  final Task? task;
  final bool isEdit;

  const NavigateToHomePage([this.task, this.isEdit = false]);

  @override
  // TODO: implement props
  List<Object?> get props => [isEdit,task];
}
class NavigateToProjectTasksScreen extends AppEvent {
  final Category category;

  const NavigateToProjectTasksScreen({required this.category});

  @override
  // TODO: implement props
  List<Object?> get props => [category];
}
class NavigateToIntroScreen extends AppEvent {

  const NavigateToIntroScreen();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}