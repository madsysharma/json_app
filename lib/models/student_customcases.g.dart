// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_customcases.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DateTimeConverter _$DateTimeConverterFromJson(Map<String, dynamic> json) =>
    DateTimeConverter();

Map<String, dynamic> _$DateTimeConverterToJson(DateTimeConverter instance) =>
    <String, dynamic>{};

StudentCustom _$StudentCustomFromJson(Map<String, dynamic> json) =>
    StudentCustom(
      id: json['id'] as String,
      name: json['name'] as String,
      dateOfBirth:
          const DateTimeConverter().fromJson(json['dateOfBirth'] as String),
      password: json['password'] as String,
      gpa: (json['gpa'] as num).toDouble(),
      address: json['address'] as String?,
    );

Map<String, dynamic> _$StudentCustomToJson(StudentCustom instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'dateOfBirth': const DateTimeConverter().toJson(instance.dateOfBirth),
    'password': instance.password,
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
