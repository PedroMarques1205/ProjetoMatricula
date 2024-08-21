import 'package:flutter/material.dart';
import 'package:projeto_matricula_application/view/login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test",
      home: LoginPage(),
    );
  }
}