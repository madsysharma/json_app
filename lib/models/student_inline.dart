import 'package:json_annotation/json_annotation.dart';

part 'student_inline.g.dart';

@JsonSerializable()
class StudentInline {
  final String id;
  final String name;
  final String major;
  final double gpa;
  final int creditsRequired;
  final int creditsCompleted;
  final int creditsRemaining;

  // Inline Credits as a Map instead of a class
  //final Map<String, int> credits;

  StudentInline({
    required this.id,
    required this.name,
    required this.major,
    required this.gpa,
    required this.creditsRequired,
    required this.creditsCompleted,
    required this.creditsRemaining,
  });

  factory StudentInline.fromJson(Map<String, dynamic> json) => _$StudentInlineFromJson(json);
  Map<String, dynamic> toJson() => _$StudentInlineToJson(this);
}