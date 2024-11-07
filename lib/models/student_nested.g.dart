// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_nested.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Credits _$CreditsFromJson(Map<String, dynamic> json) => Credits(
      required: (json['required'] as num).toInt(),
      completed: (json['completed'] as num).toInt(),
      remaining: (json['remaining'] as num).toInt(),
    );

Map<String, dynamic> _$CreditsToJson(Credits instance) => <String, dynamic>{
      'required': instance.required,
      'completed': instance.completed,
      'remaining': instance.remaining,
    };

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      id: json['id'] as String,
      name: json['name'] as String,
      major: json['major'] as String,
      gpa: (json['gpa'] as num).toDouble(),
      credits: Credits.fromJson(json['credits'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'major': instance.major,
      'gpa': instance.gpa,
      'credits': instance.credits,
    };
