import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserService {
  static const url = "http://10.102.168.150:3000/user";

  static Future<List<User>> fetchUsers() async {

    try {

      final response =
          await http
              .get(Uri.parse(url))
              .timeout(const Duration(seconds: 5));

      if (response.statusCode != 200) {
        throw Exception("Erro ${response.statusCode}");
      }

      final decoded =
          jsonDecode(response.body) as List;

      return decoded
          .map((e) => User.fromJson(e))
          .toList();

    } catch (_) {
      throw Exception(
        "Falha ao conectar com a API"
      );
    }
  }
}
