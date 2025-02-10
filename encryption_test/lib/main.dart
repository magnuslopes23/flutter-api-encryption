import 'package:flutter/material.dart';
import 'api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter Encryption Test")),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await apiService.testEncryption();
            },
            child: Text("Test Encryption"),
          ),
        ),
      ),
    );
  }
}
