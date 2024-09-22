// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      date: (json['date'] as num).toInt(),
      address: json['address'] as String,
      status: json['status'] as String,
      category: json['category'] as String,
      isNotify: (json['isNotify'] as num).toInt(),
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'date': instance.date,
      'address': instance.address,
      'status': instance.status,
      'category': instance.category,
      'isNotify': instance.isNotify,
    };
