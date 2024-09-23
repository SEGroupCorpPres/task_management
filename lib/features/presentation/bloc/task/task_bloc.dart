import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/features/data/local/models/task.dart';
import 'package:task_management/features/data/repositories/task_repository_impl.dart';
import 'package:task_management/features/domain/use_cases/use_cases.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepositoryImpl repository = TaskRepositoryImpl();

  final GetTasks getTasks;
  final GetTaskById getTaskById;
  final GetTaskByCategory getTaskByCategory;
  final CreateTask createTask;
  final UpdateTask updateTask;
  final DeleteTask deleteTask;

  TaskBloc({required this.getTasks, required this.createTask, required this.updateTask, required this.deleteTask, required this.getTaskById, required this.getTaskByCategory}) : super(TaskInitial()) {
    on<LoadTasks>(_onLoadTasks);
    on<GetTaskByIdEvent>(_onGetTaskById);
    on<LoadTasksByCategory>(_onLoadTasksByCategory);
    on<AddTask>(_onAddTasks);
    on<UpdateExistingTask>(_onUpdateTasks);
    on<DeleteExistingTask>(_onDeleteTasks);
  }

  Future<void> _onLoadTasks(LoadTasks event, Emitter<TaskState> emit) async {
    try {
      emit(TaskLoading());
      final tasks = await getTasks();
      emit(TaskLoaded(tasks: tasks));
    } catch (e) {
      emit(TaskError());
    }
  }

  Future<void> _onGetTaskById(GetTaskByIdEvent event, Emitter<TaskState> emit) async {
    try {
      emit(TaskLoading());
      final Task? task = await getTaskById(event.id);
      if (task != null) {
        emit(TaskLoaded(tasks: [task]));
      } else {
        emit(TaskError());
      }
    } catch (e) {
      emit(TaskError());
    }
  }

  Future<void> _onLoadTasksByCategory(LoadTasksByCategory event, Emitter<TaskState> emit) async {
    try {
      emit(TaskLoading());
      final List<Task> taskList = await getTaskByCategory(event.category);
      emit(TaskLoaded(tasks: taskList));
    } catch (e) {
      emit(TaskError());
    }
  }

  Future<void> _onAddTasks(AddTask event, Emitter<TaskState> emit) async {
    try {
      await createTask(event.task);
      add(LoadTasks());
    } catch (e) {
      emit(TaskError());
      log(e.toString());
    }
  }

  Future<void> _onUpdateTasks(UpdateExistingTask event, Emitter<TaskState> emit) async {
    try {
      await updateTask(event.task);
      add(LoadTasks());
    } catch (e) {
      emit(TaskError());
    }
  }

  Future<void> _onDeleteTasks(DeleteExistingTask event, Emitter<TaskState> emit) async {
    try {
      await deleteTask(event.id);
      add(LoadTasks());
    } catch (e) {
      emit(TaskError());
    }
  }
}
