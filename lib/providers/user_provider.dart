import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/models/models.dart';
import 'package:prueba_tecnica/services/services.dart';

class UserProvider extends ChangeNotifier {
  User? user;

  void logout() {
    user = null;
    notifyListeners();
  }

  void setUser(User user) {
    this.user = user;
    notifyListeners();
  }

  Future<bool> login(String email, String password, context) async {
    final authService = Provider.of<AuthService>(context, listen: false);

    final response =
        await authService.loginWithEmailAndPassword(email, password);

    if (response != null) {
      final userData = await authService.getUserData(response.token);

      if (userData != null) {
        setUser(userData);
        return true;
      }
    }

    return false;
  }

  Future<String> loginToken() async {
    final token = await AuthService().readToken();
    if (token == "") return token;

    final user = await AuthService().getUserData(token);

    if (user != null) {
      setUser(user);
      return token;
    } else {
      await AuthService().logout();
      return "";
    }
  }
}
