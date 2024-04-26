import 'package:flutter/material.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey();

  static showSnackBar(
      String message, Color color, IconData icon, Duration duration) {
    final snackBar = SnackBar(
      duration: duration,
      content: Row(
        children: [
          Icon(icon, color: Colors.white), // icono personalizable
          const SizedBox(width: 5),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Text(message,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(color: Colors.white, fontSize: 15)),
            ),
          ), // mensaje personalizable
        ],
      ),
      backgroundColor: color, // color de fondo personalizable
    );
    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
