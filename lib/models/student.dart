import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

@JsonSerializable()
class Student {
  final String id;
  final String name;
  final String major;
  final double gpa;

  Student(this.id,this.name,this.major,this.gpa);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'major': major,
      'gpa':gpa,
    };
  }

  Student.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        id = json['id'] as String,
        gpa = json['gpa'] as double,
        major = json['major'] as String;

  factory Student.fromJsonAutomatic(Map<String, dynamic> json) => _$StudentFromJson(json);
  Map<String, dynamic> toJsonAutomatic() => _$StudentToJson(this);

  @override
  String toString() {
    return """
      \n
      Object Data:
        id: $id,
        name: $name,
        major: $major,
        gpa: $gpa
    """;
  }
}