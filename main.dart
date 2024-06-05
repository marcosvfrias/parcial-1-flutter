// Main Dart

import 'package:flutter/material.dart';
import 'chat_page.dart';

// Función principal que inicia la aplicación
void main() {
  runApp(MyApp());
}

// Widget principal de la aplicación
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Título de la aplicación
      title: 'Chat App',
      // Tema de la aplicación
      theme: ThemeData(
        primarySwatch: Colors.blue, // Color principal del tema
        scaffoldBackgroundColor: Colors.grey[200], // Color de fondo del scaffold
      ),
      // Pantalla principal de la aplicación
      home: ChatPage(),
    );
  }
}
