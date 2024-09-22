import 'package:task_management/features/data/local/models/task.dart';
import 'package:task_management/features/data/repositories/task_repository_impl.dart';

class CreateTask {
  final TaskRepositoryImpl repository;

  CreateTask(this.repository);

  Future<void> call(Task task) async {
    await repository.createTask(task);
  }
}

class GetTasks {
  final TaskRepositoryImpl repository;

  GetTasks(this.repository);

  Future<List<Task>> call() async {
    return await repository.getTasks();
  }
}

class GetTaskById {
  final TaskRepositoryImpl repository;

  GetTaskById(this.repository);

  Future<Task?> call(int id) async {
    return await repository.getTaskById(id);
  }
}

class UpdateTask {
  final TaskRepositoryImpl repository;

  UpdateTask(this.repository);

  Future<void> call(Task task) async {
    await repository.updateTask(task);
  }
}

class DeleteTask {
  final TaskRepositoryImpl repository;

  DeleteTask(this.repository);

  Future<void> call(int id) async {
    await repository.deleteTask(id);
  }
}
