import 'package:flutter/material.dart';
import 'models/student.dart';  // Assuming Student model with manual and automatic serialization
import 'models/student_nested.dart';  // Assuming you have this model
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
  int _counter = 0;
  String _result = '';

  void _incrementCounter() {
    setState(() {
      _counter++;
      _result = _counter.toString();
    });
  }

  // manual method
  void manualSerialize() {
    Student s1 = Student("1024", "Jack Ring", "CSE", 3.33);
    Map<String, dynamic> toJson = s1.toJson();
    String jsonString = jsonEncode(toJson);

    // Print to terminal and update UI
    print('JSON map: $toJson');
    print('Serialized JSON: $jsonString');
    setState(() {
      _result = 'Serialized JSON: $jsonString';
    });
  }

  void manualDeserialize() {
    Student s1 = Student("1024", "Jack Ring", "CSE", 3.33);
    String jsonString = jsonEncode(s1.toJson());
    Map<String, dynamic> decodedJson = jsonDecode(jsonString);
    Student decoded = Student.fromJson(decodedJson);

    // Print to terminal and update UI
    print('Deserialized from JSON: $decoded');
    setState(() {
      _result = 'Deserialized from JSON: $decoded';
    });
  }

  // auto serialization
  void autoSerialize() {
    Student s1 = Student("1024", "Jack Ring", "CSE", 3.33);
    Map<String, dynamic> toJson = s1.toJsonAutomatic();
    String jsonString = jsonEncode(toJson);

    // Print to terminal and update UI
    print('JSON map: $toJson');
    print('Serialized JSON: $jsonString');
    setState(() {
      _result = 'Serialized JSON: $jsonString';
    });
  }

  void autoDeserialize() {
    Student s1 = Student("1024", "Jack Ring", "CSE", 3.33);
    String jsonString = jsonEncode(s1.toJson());
    Map<String, dynamic> decodedJson = jsonDecode(jsonString);
    Student decodedAutomatic = Student.fromJsonAutomatic(decodedJson);

    // Print to terminal and update UI
    print('Deserialized from JSON: $decodedAutomatic');
    setState(() {
      _result = 'Deserialized from JSON: $decodedAutomatic';
    });
  }

  // Nested Serialization
  void nestedSerialize() {
    StudentNested s1 = StudentNested(
      id: "1024",
      name: "Jack Ring",
      major: "CSE",
      gpa: 3.33,
      credits: Credits(completed: 120, required: 180, remaining: 30), // Nested object for credits
    );
    Map<String, dynamic> toJson = s1.toJson();
    String jsonString = jsonEncode(toJson);

    // Print to terminal and update UI
    print('Nested JSON map: $toJson');
    print('Nested Serialized JSON: $jsonString');
    setState(() {
      _result = 'Nested Serialized JSON: $jsonString';
    });
  }

  void nestedDeserialize() {
    StudentNested s1 = StudentNested(
      id: "1024",
      name: "Jack Ring",
      major: "CSE",
      gpa: 3.33,
      credits: Credits(completed: 120, required: 180, remaining: 30), // Nested object for credits
    );
    String jsonString = jsonEncode(s1.toJson());
    Map<String, dynamic> decodedJson = jsonDecode(jsonString);
    StudentNested decodedNested = StudentNested.fromJson(decodedJson);

    // Print to terminal and update UI
    print('Deserialized Nested from JSON: $decodedNested');
    setState(() {
      _result = 'Deserialized Nested from JSON: $decodedNested';
    });
  }


  // Inline Serialization
  void inlineSerialize() {
    StudentInline s1 = StudentInline(id: "1024", 
    name: "Jack Ring",
      major: "CSE",
      gpa: 3.33,
      creditsCompleted: 120,
      creditsRequired: 180, 
      creditsRemaining: 30 // Inline credits 
    );
    Map<String, dynamic> toJson = s1.toJson();
    String jsonString = jsonEncode(toJson);

    // Print to terminal and update UI
    print('Inline JSON map: $toJson');
    print('Inline Serialized JSON: $jsonString');
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
      creditsRemaining: 30 );
    String jsonString = jsonEncode(s1.toJson());
    Map<String, dynamic> decodedJson = jsonDecode(jsonString);
    StudentInline decodedInline = StudentInline.fromJson(decodedJson);

    // Print to terminal and update UI
    print('Deserialized Inline from JSON: $decodedInline');
    setState(() {
      _result = 'Deserialized Inline from JSON: $decodedInline';
    });
  }

  // Custom Case Serialization
  void customSerialize() {
    StudentCustom s1 = StudentCustom(
      id: "1024",
      name: "Jack Ring",
      dateOfBirth: DateTime(1999, 10, 10, 12, 30),
      password: "secret", // Will be ignored in serialization
      address: null, // Will be excluded since it's null
      //gpa: 3.33
      
    );
    Map<String, dynamic> toJson = s1.toJson();
    String jsonString = jsonEncode(toJson);

    // Print to terminal and update UI
    print('Custom JSON map: $toJson');
    print('Custom Serialized JSON: $jsonString');
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
      //gpa: 3.33
      //address: "123 Main St",
    );
    String jsonString = jsonEncode(s1.toJson());
    Map<String, dynamic> decodedJson = jsonDecode(jsonString);
    StudentCustom decodedCustom = StudentCustom.fromJson(decodedJson);

    // Print to terminal and update UI
    print('Deserialized Custom from JSON: $decodedCustom');
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Click to demonstrate serialization or deserialization.'
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Results:',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                _result
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.purple,
                    ),
                    onPressed: manualSerialize,
                    child: const Text('Serialize (Manual)')
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.purple,
                    ),
                    onPressed: manualDeserialize,
                    child: const Text('Deserialize (Manual)')
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.purple,
                    ),
                    onPressed: autoSerialize,
                    child: const Text('Serialize (Auto)')
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.purple,
                    ),
                    onPressed: autoDeserialize,
                    child: const Text('Deserialize (Auto)')
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.purple,
                    ),
                    onPressed: nestedSerialize,
                    child: const Text('Serialize (Nested)')
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.purple,
                    ),
                    onPressed: nestedDeserialize,
                    child: const Text('Deserialize (Nested)')
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.purple,
                    ),
                    onPressed: inlineSerialize,
                    child: const Text('Serialize (Inline)')
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.purple,
                    ),
                    onPressed: inlineDeserialize,
                    child: const Text('Deserialize (Inline)')
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.purple,
                    ),
                    onPressed: customSerialize,
                    child: const Text('Serialize (Custom Cases)')
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.purple,
                    ),
                    onPressed: customDeserialize,
                    child: const Text('Deserialize (Custom Cases)')
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
