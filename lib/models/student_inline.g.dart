// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_inline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      id: json['id'] as String,
      name: json['name'] as String,
      major: json['major'] as String,
      gpa: (json['gpa'] as num).toDouble(),
      creditsRequired: (json['creditsRequired'] as num).toInt(),
      creditsCompleted: (json['creditsCompleted'] as num).toInt(),
      creditsRemaining: (json['creditsRemaining'] as num).toInt(),
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'major': instance.major,
      'gpa': instance.gpa,
      'creditsRequired': instance.creditsRequired,
      'creditsCompleted': instance.creditsCompleted,
      'creditsRemaining': instance.creditsRemaining,
    };
