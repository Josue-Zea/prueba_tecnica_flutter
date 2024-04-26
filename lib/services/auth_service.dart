import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_tecnica/config.dart';
import 'package:prueba_tecnica/models/models.dart';
import 'package:prueba_tecnica/services/services.dart';

class AuthService extends ChangeNotifier {
  final storage = const FlutterSecureStorage();

  Future<void> logout() async {
    await storage.delete(key: "token");
  }

  Future<String> readToken() async {
    return await storage.read(key: "token") ?? "";
  }

  Future<UserResponse?> loginWithEmailAndPassword(
      String email, String password) async {
    final Map<String, dynamic> authData = {
      'username': email,
      'password': password,
    };

    final String bodyEncoded = json.encode(authData);
    final url = Uri.parse('$apiUrl/auth/login');

    final response = await http.post(url,
        headers: <String, String>{'Content-Type': 'application/json'},
        body: bodyEncoded);

    if (response.statusCode == 200) {
      final UserResponse user = userResponseFromJson(response.body);
      await storage.write(key: "token", value: user.token);
      return user;
    } else {
      final result = json.decode(response.body)['message'];
      NotificationsService.showSnackBar(
          result, Colors.black, Icons.cancel, const Duration(seconds: 2));
      return null;
    }
  }

  Future<User?> getUserData(String token) async {
    final url = Uri.parse('$apiUrl/auth/me');
    final response = await http.get(
      url,
      headers: <String, String>{'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final User user = userFromJson(response.body);
      return user;
    } else {
      final result = json.decode(response.body)['message'];
      NotificationsService.showSnackBar(
          result, Colors.black, Icons.cancel, const Duration(seconds: 2));
      return null;
    }
  }
}
