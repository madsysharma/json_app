import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';

part 'student_customcases.g.dart';

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) => DateFormat('yyyy-MM-dd HH:mm:ss').parse(json);

  @override
  String toJson(DateTime object) => DateFormat('yyyy-MM-dd HH:mm:ss').format(object);
}

@JsonSerializable()
class Student {
  @JsonKey(name: 'id')
  final String studentId;

  final String name;

  @DateTimeConverter()
  final DateTime dateOfBirth;

  @JsonKey(ignore: true)
  final String? password; // Make password optional 

  @JsonKey(defaultValue: 4.0)
  final double gpa;

  @JsonKey(includeIfNull: false) // Exclude this field if it's null
  final String? address;

  Student({
    required this.studentId,
    required this.name,
    required this.dateOfBirth,
    this.password, // Optional
    this.gpa = 4.0, // Default GPA in case it's missing in JSON
    this.address //Nullable
  });

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
