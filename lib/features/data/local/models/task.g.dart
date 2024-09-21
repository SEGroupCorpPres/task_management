// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      date: DateTime.parse(json['date'] as String),
      address: json['address'] as String,
      status: $enumDecode(_$StatusEnumMap, json['status']),
      category: $enumDecode(_$CategoryEnumMap, json['category']),
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'date': instance.date.toIso8601String(),
      'address': instance.address,
      'status': _$StatusEnumMap[instance.status]!,
      'category': _$CategoryEnumMap[instance.category]!,
    };

const _$StatusEnumMap = {
  Status.inProgress: 'inProgress',
  Status.completed: 'completed',
  Status.canceled: 'canceled',
};

const _$CategoryEnumMap = {
  Category.personal: 'personal',
  Category.work: 'work',
  Category.meeting: 'meeting',
  Category.shopping: 'shopping',
  Category.party: 'party',
  Category.study: 'study',
};
