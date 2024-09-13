import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkService {
  final String baseUrl = 'http://13.127.246.196:8000';

  Future<http.Response> registerUser(
      String fullName, String email, String password) async {
    final url = Uri.parse('$baseUrl/api/registers/');

    final Map<String, dynamic> body = {
      'full_name': fullName,
      'email': email,
      'password': password,
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );

      return response;
    } catch (e) {
      throw Exception('Failed to register user: $e');
    }
  }

  Future<http.Response> loginUser(String email, String password) async {
    final url = Uri.parse('$baseUrl/login/');

    final Map<String, dynamic> body = {
      'email': email,
      'password': password,
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );

      return response;
    } catch (e) {
      throw Exception('Failed to login user: $e');
    }
  }
}
