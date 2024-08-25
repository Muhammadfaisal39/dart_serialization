import 'dart:convert';

import 'package:dart_searlization/user_model.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    UserModel userObject = UserModel(id: "001", name: "Muhammad Faisal", email: "abc@gmail.com");

    String userJson = '{"id": "002", "name" : "Hamza", "email" : "abcd@gmail.com"}';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text("Dart Serialization"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Map<String, dynamic> userMap = userObject.toMap();
              String encodedJson = jsonEncode(userMap);
              print(encodedJson);
            }, child: const Text("Serialization")),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(onPressed: (){
              var decodedJson = jsonDecode(userJson);
              Map<String, dynamic> userMapp = decodedJson;
              UserModel user = UserModel.fromMap(userMapp);
              print(user.email.toString());

            }, child: const Text("De-Serialization")),
          ],
        ),
      ),
    );
  }
}
