// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_customcases.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentCustom _$StudentCustomFromJson(Map<String, dynamic> json) =>
    StudentCustom(
      id: json['id'] as String,
      name: json['name'] as String,
      dateOfBirth:
          const DateTimeConverter().fromJson(json['dateOfBirth'] as String),
      gpa: (json['gpa'] as num?)?.toDouble() ?? 4.0,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$StudentCustomToJson(StudentCustom instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'dateOfBirth': const DateTimeConverter().toJson(instance.dateOfBirth),
    'gpa': instance.gpa,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('address', instance.address);
  return val;
}
