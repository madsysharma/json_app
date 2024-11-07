import 'package:json_annotation/json_annotation.dart';

part 'student_inline.g.dart';

@JsonSerializable()
class StudentInline {
  final String id;
  final String name;
  final String major;
  final double gpa;
  final int creditsCompleted;
  final int creditsRequired;
  final int creditsRemaining;

  StudentInline({
    required this.id,
    required this.name,
    required this.major,
    required this.gpa,
    required this.creditsCompleted,
    required this.creditsRequired,
    required this.creditsRemaining,
  });

  
  factory StudentInline.fromJson(Map<String, dynamic> json) => _$StudentInlineFromJson(json);

  
  Map<String, dynamic> toJson() => _$StudentInlineToJson(this);

  
  @override
  String toString() {
    return '\n StudentInline: (\n id: $id,\n name: $name,\n major: $major,\n gpa: $gpa,\n creditsCompleted: $creditsCompleted,\n creditsRequired: $creditsRequired,\n creditsRemaining: $creditsRemaining)';
  }
}
