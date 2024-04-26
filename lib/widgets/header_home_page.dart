import 'package:flutter/material.dart';

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({
    super.key,
    required this.screenSize,
  });

  final double screenSize;
  final String item1 = "Cerrar sesión";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: PopupMenuButton(
              child: const Icon(
                Icons.menu,
                size: 50,
              ),
              itemBuilder: (_) => [
                PopupMenuItem(
                  value: item1,
                  child: Text(item1),
                )
              ],
              onSelected: (value) {
                Navigator.pushReplacementNamed(context, 'login');
              },
            ),
          )
        ],
      ),
    );
  }
}
