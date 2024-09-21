import 'package:task_management/features/data/local/models/category.dart';
import 'package:task_management/features/data/local/models/status.dart';

class TaskModel {
  final String title;
  final String description;
  final DateTime date;
  final String address;
  final Status status;
  final Category category;

  TaskModel({
    required this.title,
    required this.description,
    required this.date,
    required this.address,
    required this.status,
    required this.category,
  });
}
