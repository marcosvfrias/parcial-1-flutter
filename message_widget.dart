// Message_widget.dart

import 'package:flutter/material.dart';
import 'message.dart';

// Widget que representa un mensaje individual en el chat
class MessageWidget extends StatelessWidget {
  // El mensaje que se va a mostrar
  final Message message;

  // Constructor que requiere que se especifique el mensaje
  MessageWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    // Mapa que asigna un color a cada remitente
    Map<String, Color> senderColors = {
      'Erick': Colors.blue, 
      'Marcos': Colors.green, 
    };

    Color senderColor = senderColors[message.senderId] ?? Colors.grey;

    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        // Estilos para alinear los mensajes de los usuarios
        mainAxisAlignment: message.senderId == 'Erick' ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          // Contenedor que muestra el texto del mensaje
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              // Usar el color del remitente para el fondo del mensaje
              color: senderColor,
              borderRadius: BorderRadius.circular(10),
            ),
            // Mostrar el texto del mensaje 
            child: Text(
              message.text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
