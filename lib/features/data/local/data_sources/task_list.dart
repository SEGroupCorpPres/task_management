import 'package:task_management/features/data/local/models/category.dart';
import 'package:task_management/features/data/local/models/status.dart';
import 'package:task_management/features/data/local/models/task_model.dart';

class TaskListData {
  List<TaskModel> taskList = [
    TaskModel(
      id: 0,
      title: 'Title 1',
      description: 'description 1',
      date: DateTime(2024, 10, 18, 18, 15),
      address: 'address 1',
      status: Status.inProgress,
      category: Category.personal,
      isNotify: false,
    ),
    TaskModel(
      id: 1,
      title: 'Title 2',
      description: 'description 2',
      date: DateTime(2024, 10, 18, 16, 15),
      address: 'address ',
      status: Status.canceled,
      category: Category.work,
      isNotify: true,
    ),
    TaskModel(
      id: 2,
      title: 'Title 3',
      description: 'description 3',
      date: DateTime(2024, 4, 18, 10, 15),
      address: 'address 3',
      status: Status.completed,
      isNotify: false,
      category: Category.meeting,
    ),
    TaskModel(
      id: 3,
      title: 'Title 4',
      description: 'description 4',
      date: DateTime(2024, 10, 18, 20, 15),
      address: 'address 4',
      status: Status.inProgress,
      category: Category.shopping,
      isNotify: true,
    ),
    TaskModel(
      id: 4,
      title: 'Title 5',
      description: 'description 5',
      date: DateTime(2024, 9, 19, 19, 15),
      address: 'address 1',
      status: Status.canceled,
      category: Category.party,
      isNotify: false,
    ),
    TaskModel(
      id: 5,
      title: 'Title 6',
      description: 'description 6',
      date: DateTime(2024, 8, 18, 13, 15),
      address: 'address 6',
      status: Status.completed,
      category: Category.study,
      isNotify: true,
    ),
    TaskModel(
      id: 3,
      title: 'Title 4',
      description: 'description 4',
      date: DateTime(2024, 10, 18, 20, 15),
      address: 'address 4',
      status: Status.inProgress,
      category: Category.shopping,
      isNotify: true,
    ),
    TaskModel(
      id: 4,
      title: 'Title 5',
      description: 'description 5',
      date: DateTime(2024, 9, 19, 19, 15),
      address: 'address 1',
      status: Status.canceled,
      category: Category.party,
      isNotify: false,
    ),
    TaskModel(
      id: 5,
      title: 'Title 6',
      description: 'description 6',
      date: DateTime(2024, 8, 18, 13, 15),
      address: 'address 6',
      status: Status.completed,
      category: Category.study,
      isNotify: true,
    ),
  ];
}
