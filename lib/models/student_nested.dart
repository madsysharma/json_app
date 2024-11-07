import 'package:json_annotation/json_annotation.dart';

part 'student_nested.g.dart';

@JsonSerializable()
class Credits {
  final int required;
  final int completed;
  final int remaining;

  Credits({required this.required, required this.completed, required this.remaining});

  factory Credits.fromJson(Map<String, dynamic> json) => _$CreditsFromJson(json);
  Map<String, dynamic> toJson() => _$CreditsToJson(this);
}

@JsonSerializable()
class Student {
  final String id;
  final String name;
  final String major;
  final double gpa;
  final Credits credits;  // Nested object

  Student({required this.id, required this.name, required this.major, required this.gpa, required this.credits});

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
