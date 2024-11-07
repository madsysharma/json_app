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
class StudentNested {
  final String id;
  final String name;
  final String major;
  final double gpa;
  final Credits credits;

  StudentNested({
    required this.id,
    required this.name,
    required this.major,
    required this.gpa,
    required this.credits, // Nested object
  });

  factory StudentNested.fromJson(Map<String, dynamic> json) => _$StudentNestedFromJson(json);
  Map<String, dynamic> toJson() => _$StudentNestedToJson(this);
}
