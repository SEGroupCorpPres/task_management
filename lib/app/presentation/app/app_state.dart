// app_flow.dart
part of 'app_bloc.dart';

enum AppStatus { initial, homeScreen, projectTaskListScreen, introScreen }

class AppState extends Equatable {
  final AppStatus status;
  final String? errorMessage;
  final String? category;
  final Task? task;
  final bool isEdit;

  const AppState({
    this.status = AppStatus.initial,
    this.category,
    this.task,
    this.errorMessage,
    this.isEdit = false,
  });

  AppState copyWith({
    AppStatus? status,
    String? category,
    bool? isEdit,
    Task? task,
    String? errorMessage,
  }) {
    return AppState(
      status: status ?? this.status,
      category: category ?? this.category,
      isEdit: isEdit ?? this.isEdit,
      task: task ?? this.task,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        isEdit,
        task,
        errorMessage,
      ];
}
