import 'package:json_annotation/json_annotation.dart';

part 'student_inline.g.dart';

@JsonSerializable()
class Student {
  final String id;
  final String name;
  final String major;
  final double gpa;
  final int creditsRequired;
  final int creditsCompleted;
  final int creditsRemaining;

  Student({
    required this.id,
    required this.name,
    required this.major,
    required this.gpa,
    required this.creditsRequired,
    required this.creditsCompleted,
    required this.creditsRemaining,
  });

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);
}


