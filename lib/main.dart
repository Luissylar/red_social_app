import 'package:flutter/material.dart';
import 'package:red_social/pages/loginPage.dart'; // Asegúrate de importar tu pantalla de login

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // Define la página de login como la primera pantalla
    );
  }
}
