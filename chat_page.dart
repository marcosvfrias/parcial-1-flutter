// chat_page.dart

import 'package:flutter/material.dart';

// Punto de entrada de la aplicación
void main() {
  runApp(MyApp());
}

// Widget principal de la aplicación
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatPage(), // Página principal de la aplicación
    );
  }
}

// Página de chat con estado
class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // Lista de mensajes de chat generados
  final _messages = List.generate(110, (index) {
    if (index % 10 == 0 && index != 0) {
      return ChatMessage(text: '¡UN GIF!', isMe: true, isGif: true); // Mensaje de GIF
    } else if (index % 2 == 0) {
      return ChatMessage(text: 'Mensaje $index', isMe: true); // Mensaje enviado por el usuario
    } else {
      return ChatMessage(text: 'Mensaje $index', isMe: false); // Mensaje recibido
    }
  });

  final _messageController = TextEditingController(); // Controlador para el campo de texto

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.black,
              child: Text('E'), // Inicial del usuario
            ),
            SizedBox(width: 10),
            Text('Erick'), // Nombre del usuario
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.call), // Icono de llamada
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.video_call), // Icono de videollamada
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert), // Botón de más opciones
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        // Fondo de pantalla del chat
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://cdn.pixabay.com/photo/2023/05/23/18/12/hummingbird-8013214_1280.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              // Lista de mensajes
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _buildMessageBubble(_messages[index]);
                },
              ),
            ),
            _buildMessageComposer(), // Componente para escribir y enviar mensajes
          ],
        ),
      ),
    );
  }

  // Widget para mostrar cada burbuja de mensaje
  Widget _buildMessageBubble(ChatMessage message) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Mostrar los nombres de los usuario
            Text(
              message.isMe ? 'Erick' : 'Marcos',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            // Mostrar imagen GIF 
            message.isGif
                ? Image.network(
                    'https://media.giphy.com/media/5Gd5CtVtneYKU/giphy.gif',
                    width: 100,
                    height: 100,
                  )
                : Text(
                    message.text,
                    style: TextStyle(color: Colors.black),
                  ),
          ],
        ),
      ),
    );
  }

  // Widget para componer y enviar mensajes
  Widget _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration.collapsed(
                hintText: 'Enviar mensaje', // Placeholder del campo de texto
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              if (_messageController.text.isNotEmpty) {
                setState(() {
                  // Agregar mensaje a la lista de mensajes
                  _messages.add(ChatMessage(
                      text: _messageController.text, isMe: true));
                  _messageController.clear(); // Limpiar el campo de texto
                });
              }
            },
          ),
        ],
      ),
    );
  }
}

// Clase que representa un mensaje de chat
class ChatMessage {
  final String text;
  final bool isMe;
  final bool isGif;

  ChatMessage({required this.text, required this.isMe, this.isGif = false});
}
