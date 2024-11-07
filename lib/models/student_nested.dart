import 'package:json_annotation/json_annotation.dart';

part 'student_nested.g.dart';

@JsonSerializable()
class Credits {
  final int completed;
  final int required;
  final int remaining;

  Credits({
    required this.completed,
    required this.required,
    required this.remaining,
  });

 
  factory Credits.fromJson(Map<String, dynamic> json) {
    return Credits(
      completed: json['completed'],
      required: json['required'],
      remaining: json['remaining'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'completed': completed,
      'required': required,
      'remaining': remaining,
    };
  }

  @override
  String toString() {
    return '\n completed: $completed,\n required: $required,\n remaining: $remaining\n';
  }
}

class StudentNested {
  final String id;
  final String name;
  final String major;
  final double gpa;
  final Credits credits; // Nested object of type Credits

  StudentNested({
    required this.id,
    required this.name,
    required this.major,
    required this.gpa,
    required this.credits,
  });

  
  factory StudentNested.fromJson(Map<String, dynamic> json) {
    return StudentNested(
      id: json['id'],
      name: json['name'],
      major: json['major'],
      gpa: json['gpa'],
      credits: Credits.fromJson(json['credits']), // Deserialize nested Credits object
    );
  }

 
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'major': major,
      'gpa': gpa,
      'credits': credits.toJson(), // Serialize nested Credits object
    };
  }

  @override
  String toString() {
    return '\n StudentNested:( \n id: $id, \n name: $name, \n major: $major, \n gpa: $gpa, \n credits: $credits \n)';
  }
}


