import 'package:flutter/material.dart';
import 'models/student.dart';  // Assuming Student model with manual and automatic serialization
import 'models/student_nested.dart' as nested;  // Added prefix 'nested' to avoid conflict
import 'models/student_inline.dart';  // Assuming you have this model
import 'models/student_customcases.dart';  // Assuming you have custom cases model
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSON Serialization Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'JSON Serialization Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _result = '';

  // Serialization and deserialization functions
  void manualSerialize() {
    Student s1 = Student("1024", "Jack Ring", "CSE", 3.33);
    Map<String, dynamic> toJson = s1.toJson();
    String jsonString = jsonEncode(toJson);

    setState(() {
      _result = 'Serialized JSON (Manual): $jsonString';
    });
  }

  void manualDeserialize() {
    Student s1 = Student("1024", "Jack Ring", "CSE", 3.33);
    String jsonString = jsonEncode(s1.toJson());
    Map<String, dynamic> decodedJson = jsonDecode(jsonString);
    Student decoded = Student.fromJson(decodedJson);

    setState(() {
      _result = 'Deserialized from JSON (Manual): $decoded';
    });
  }

  void autoSerialize() {
    Student s1 = Student("1024", "Jack Ring", "CSE", 3.33);
    Map<String, dynamic> toJson = s1.toJsonAutomatic();
    String jsonString = jsonEncode(toJson);

    setState(() {
      _result = 'Serialized JSON (Auto): $jsonString';
    });
  }

  void autoDeserialize() {
    Student s1 = Student("1024", "Jack Ring", "CSE", 3.33);
    String jsonString = jsonEncode(s1.toJson());
    Map<String, dynamic> decodedJson = jsonDecode(jsonString);
    Student decodedAutomatic = Student.fromJsonAutomatic(decodedJson);

    setState(() {
      _result = 'Deserialized from JSON (Auto): $decodedAutomatic';
    });
  }

  void nestedSerialize() {
    nested.StudentNested s1 = nested.StudentNested(
      id: "1024",
      name: "Jack Ring",
      major: "CSE",
      gpa: 3.33,
      credits: nested.Credits(completed: 120, required: 180, remaining: 30),
    );
    Map<String, dynamic> toJson = s1.toJson();
    String jsonString = jsonEncode(toJson);

    setState(() {
      _result = 'Nested Serialized JSON: $jsonString';
    });
  }

  void nestedDeserialize() {
    nested.StudentNested s1 = nested.StudentNested(
      id: "1024",
      name: "Jack Ring",
      major: "CSE",
      gpa: 3.33,
      credits: nested.Credits(completed: 120, required: 180, remaining: 30),
    );
    String jsonString = jsonEncode(s1.toJson());
    Map<String, dynamic> decodedJson = jsonDecode(jsonString);
    nested.StudentNested decodedNested = nested.StudentNested.fromJson(decodedJson);

    setState(() {
      _result = 'Deserialized Nested from JSON: $decodedNested';
    });
  }

  void inlineSerialize() {
    StudentInline s1 = StudentInline(id: "1024", 
      name: "Jack Ring",
      major: "CSE",
      gpa: 3.33,
      creditsCompleted: 120,
      creditsRequired: 180, 
      creditsRemaining: 30,
    );
    Map<String, dynamic> toJson = s1.toJson();
    String jsonString = jsonEncode(toJson);

    setState(() {
      _result = 'Inline Serialized JSON: $jsonString';
    });
  }

  void inlineDeserialize() {
    StudentInline s1 = StudentInline(id: "1024", 
      name: "Jack Ring",
      major: "CSE",
      gpa: 3.33,
      creditsCompleted: 120,
      creditsRequired: 180, 
      creditsRemaining: 30,
    );
    String jsonString = jsonEncode(s1.toJson());
    Map<String, dynamic> decodedJson = jsonDecode(jsonString);
    StudentInline decodedInline = StudentInline.fromJson(decodedJson);

    setState(() {
      _result = 'Deserialized Inline from JSON: $decodedInline';
    });
  }

  void customSerialize() {
    StudentCustom s1 = StudentCustom(
      id: "1024",
      name: "Jack Ring",
      dateOfBirth: DateTime(1999, 10, 10, 12, 30),
      password: "secret", // Will be ignored in serialization
      address: null, // Will be excluded since it's null
      gpa: 4.0,
    );
    Map<String, dynamic> toJson = s1.toJson();
    String jsonString = jsonEncode(toJson);

    setState(() {
      _result = 'Custom Serialized JSON: $jsonString';
    });
  }

  void customDeserialize() {
    StudentCustom s1 = StudentCustom(
      id: "1024",
      name: "Jack Ring",
      dateOfBirth: DateTime(1999, 10, 10, 12, 30),
      password: "secret", // Will be ignored in serialization
      address: null, // Will be excluded since it's null
      gpa : 4.0,
    );
    String jsonString = jsonEncode(s1.toJson());
    Map<String, dynamic> decodedJson = jsonDecode(jsonString);
    StudentCustom decodedCustom = StudentCustom.fromJson(decodedJson);

    setState(() {
      _result = 'Deserialized Custom from JSON: $decodedCustom';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("JSON Serialization Demo"),
      ),
      body: Row(
        children: <Widget>[
          // Left column for buttons (taking up 50% of the screen)
          Expanded(
            flex: 1,  // Taking 50% width
            child: ListView(
              padding: const EdgeInsets.all(10.0),
              children: <Widget>[
                _buildButton('Serialize (Manual)', manualSerialize, Colors.green),
                _buildButton('Deserialize (Manual)', manualDeserialize, Colors.blue),
                _buildButton('Serialize (Auto)', autoSerialize, Colors.red),
                _buildButton('Deserialize (Auto)', autoDeserialize, Colors.orange),
                _buildButton('Serialize (Nested)', nestedSerialize, Colors.purple),
                _buildButton('Deserialize (Nested)', nestedDeserialize, Colors.cyan),
                _buildButton('Serialize (Inline)', inlineSerialize, Colors.teal),
                _buildButton('Deserialize (Inline)', inlineDeserialize, Colors.indigo),
                _buildButton('Serialize (Custom)', customSerialize, Colors.amber),
                _buildButton('Deserialize (Custom)', customDeserialize, Colors.deepPurple),
              ],
            ),
          ),
          // Right column for output display (also taking up 50% of the screen)
          Expanded(
            flex: 1,  // Taking 50% width
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Result:',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Text(
                      _result,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build buttons with custom text color
  Widget _buildButton(String label, VoidCallback onPressed, Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(200, 50),
          backgroundColor: Colors.pink[50],
          textStyle: TextStyle(fontSize: 14, color: Colors.white), // Set button text color
        ),
        child: Text(label),
      ),
    );
  }
}
