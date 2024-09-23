part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class LoadTasks extends TaskEvent {}

class GetTaskByIdEvent extends TaskEvent {
  final int id;

  const GetTaskByIdEvent({required this.id});

  @override
  List<Object> get props => [id];
}
class LoadTasksByCategory extends TaskEvent {
  final String category;

  const LoadTasksByCategory({required this.category});

  @override
  List<Object> get props => [category];
}

class AddTask extends TaskEvent {
  final Task task;

  const AddTask({required this.task});

  @override
  List<Object> get props => [task];
}

class UpdateExistingTask extends TaskEvent {
  final Task task;

  const UpdateExistingTask({required this.task});

  @override
  List<Object> get props => [task];
}

class DeleteExistingTask extends TaskEvent {
  final int id;

  const DeleteExistingTask({required this.id});

  @override
  List<Object> get props => [id];
}
