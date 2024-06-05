// message.dart

// Clase que representa un mensaje en el chat
class Message {
  // Texto del mensaje
  final String text;
  
  // Identificador del remitente del mensaje
  final String senderId;

  // Constructor que requiere que se especifiquen el texto y el identificador del remitente
  Message({required this.text, required this.senderId});
}
