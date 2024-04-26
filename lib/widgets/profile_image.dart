import 'package:flutter/material.dart';
import 'package:prueba_tecnica/providers/providers.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.userProvider,
  });

  final UserProvider userProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 90, // Tamaño deseado para la imagen circular
        height: 90,
        decoration: BoxDecoration(
          shape: BoxShape.circle, // Establece la forma circular
          border: Border.all(
            color: const Color.fromARGB(255, 0, 186, 253), // Color del borde
            width: 2.0, // Ancho del borde
          ),
        ),
        child: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(userProvider.user?.image ?? ''),
          fit: BoxFit.cover,
        ));
  }
}
