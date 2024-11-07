import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';

part 'student_customcases.g.dart'; 

@JsonSerializable()
class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) => DateFormat('yyyy-MM-dd HH:mm:ss').parse(json);

  @override
  String toJson(DateTime object) => DateFormat('yyyy-MM-dd HH:mm:ss').format(object);
}

@JsonSerializable()
class StudentCustom {
  @JsonKey(name: 'id')
  final String id;

  final String name;

  @DateTimeConverter()
  final DateTime dateOfBirth;

  @JsonKey(includeFromJson: false, includeToJson: false)
  //@JsonKey(ignore: true)
  final String? password;

  @JsonKey(includeIfNull: false) // deafult value
  final double gpa;

  @JsonKey(includeIfNull: false) // Exclude this field if it's null
  final String? address;

  StudentCustom({
    required this.id,
    required this.name,
    required this.dateOfBirth,
    this.password,
    required this.gpa,
    this.address,
  });

  factory StudentCustom.fromJson(Map<String, dynamic> json) {
    return StudentCustom(
      id: json['id'],
      name: json['name'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      password: json['password'], // Excluded from serialization
      gpa: json['gpa'] ?? 4.0, // Default GPA value if not provided
      address: json['address'], // Can be null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'gpa': gpa,
      if (address != null) 'address': address,
    };
  }

  @override
  String toString() {
    return '\nStudentCustom: (\n id: $id,\n name: $name,\n dateOfBirth: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(dateOfBirth)},\n gpa: $gpa,\n address: $address )';
  }
}