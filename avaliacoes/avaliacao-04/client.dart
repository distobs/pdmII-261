import 'dart:io';
import 'dart:convert';

void main() async {
  final socket = await Socket.connect('localhost', 3030);
  
  socket.write('Hello Server!\n');
  
  socket.listen(
    (data) => print('Server: ${utf8.decode(data)}'),
    onDone: () => socket.destroy(),
  );
}