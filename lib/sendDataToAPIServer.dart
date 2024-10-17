import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SendDataScreen(),
    );
  }
}

class SendDataScreen extends StatefulWidget {
  @override
  _SendDataScreenState createState() => _SendDataScreenState();
}

class _SendDataScreenState extends State<SendDataScreen> {
  final TextEditingController _controller = TextEditingController();

  Future<void> sendData() async {
    String inputText = _controller.text;

    // API URL
    // String apiUrl = 'http://127.0.0.1:5000/createProduct';
    String apiUrl = 'http://192.168.5.2:5050/createProduct';

    // Prepare the body (JSON data)
    Map<String, dynamic> body = {
      'text': inputText,  // key:value pair as per API requirement
    };

    // Make a POST request
    var response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      // Successfully sent data
      print("Response: ${response.body}");
    } else {
      // Error occurred
      print("Failed: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Data to API"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility)
              ),
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter text'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: sendData,
              child: Text("Send Data"),
            ),
          ],
        ),
      ),
    );
  }
}
