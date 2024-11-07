import 'package:flutter/material.dart';
import 'models/student.dart';
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
