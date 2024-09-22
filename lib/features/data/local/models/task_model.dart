import 'package:task_management/features/data/local/models/category.dart';
import 'package:task_management/features/data/local/models/status.dart';

class TaskModel implements Comparable<TaskModel> {
  final int id;
  final String title;
  final String description;
  final DateTime date;
  final String address;
  final Status status;
  final Category category;
  final bool isNotify;

  TaskModel({required this.id, required this.title, required this.description, required this.date, required this.address, required this.status, required this.category, required this.isNotify});

  TaskModel copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? date,
    String? address,
    Status? status,
    Category? category,
    bool? isNotify,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      address: address ?? this.address,
      status: status ?? this.status,
      category: category ?? this.category,
      isNotify: isNotify ?? this.isNotify,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          other.title == title &&
          other.description == description &&
          other.date == date &&
          other.address == address &&
          other.status == status &&
          other.category == category &&
          other.isNotify == isNotify;

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ description.hashCode ^ date.hashCode ^ address.hashCode ^ status.hashCode ^ category.hashCode ^ isNotify.hashCode;
  }

  @override
  int compareTo(TaskModel other) => date.compareTo(other.date);

}
