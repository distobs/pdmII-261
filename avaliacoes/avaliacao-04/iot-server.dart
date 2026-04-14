import 'dart:io';
import 'dart:async';
import 'dart:math';

double tempGen() {
  return 26 + (Random().nextDouble() * 3);
}

void main() async {
  final server = await ServerSocket.bind(InternetAddress.anyIPv4, 3030);
  final clients = <Socket>{};

  ProcessSignal.sigint.watch().listen((_) async {
    await server.close();
    exit(0);
  });

  ProcessSignal.sigterm.watch().listen((_) async {
    await server.close();
    exit(0);
  });

  print('${server.address.address}:${server.port}');
  print('Ctrl+C to stop.');


  Timer.periodic(Duration(seconds: 10), (Timer t) {
    final temp = tempGen().toStringAsFixed(2);

    for (final client in clients) {
      client.write(temp);
    }
  });
  
  await for (final client in server) {
    print('Ô lasqueira');
    clients.add(client);

    client.listen(
      (_) {
        print('Tô');
      },
      onDone: () {
        print('Saiu');
        clients.remove(client);
        client.close();
      },
      onError: (_) {
        clients.remove(client);
        client.close();
      }
    );
  }
}
