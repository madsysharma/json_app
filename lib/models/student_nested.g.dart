// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_nested.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Credits _$CreditsFromJson(Map<String, dynamic> json) => Credits(
      completed: (json['completed'] as num).toInt(),
      required: (json['required'] as num).toInt(),
      remaining: (json['remaining'] as num).toInt(),
    );

Map<String, dynamic> _$CreditsToJson(Credits instance) => <String, dynamic>{
      'completed': instance.completed,
      'required': instance.required,
      'remaining': instance.remaining,
    };
