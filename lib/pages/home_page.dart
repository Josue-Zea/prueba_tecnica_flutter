import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/models/models.dart';
import 'package:prueba_tecnica/providers/providers.dart';
import 'package:prueba_tecnica/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            HeaderHomePage(screenSize: screenSize.height * 0.25),
            Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 30),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: screenSize.height * 0.4,
                        width: screenSize.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                              20), // Ajusta el valor para cambiar el radio de esquina
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 80),
                            _TitleUser(
                              text:
                                  "${userProvider.user?.firstName} ${userProvider.user?.lastName}",
                              gender: userProvider.user?.gender ?? "female",
                            ),
                            Container(
                              height: 2,
                              color: Colors.black,
                              margin: const EdgeInsets.only(bottom: 10),
                            ),
                            _UserData(user: userProvider.user),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    ProfileImage(userProvider: userProvider),
                    const Expanded(child: SizedBox()),
                  ],
                )
              ],
            ),
            SizedBox(height: screenSize.height * 0.25),
          ],
        ),
      )),
    );
  }
}

class _UserData extends StatelessWidget {
  const _UserData({required this.user});

  final User? user;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _DataUserText(text: "Email: ${user?.email}"),
          _DataUserText(text: "Genero: ${user?.gender}"),
          _DataUserText(text: "Teléfono: ${user?.phone}"),
          _DataUserText(
              // ignore: prefer_interpolation_to_compose_strings
              text: "Fecha de nacimiento:" +
                  "${user?.birthDate}"
                      .replaceAll("0", "")
                      .replaceAll(":", "")
                      .replaceAll(".", "")),
          _DataUserText(text: "Altura: ${user?.height} cm"),
          _DataUserText(text: "Peso: ${user?.weight} kg"),
          _DataUserText(
              text:
                  "Dirección: ${user?.address.address} ${user?.address.city}"),
        ],
      ),
    );
  }
}

class _DataUserText extends StatelessWidget {
  const _DataUserText({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Colors.black, fontSize: 15),
    );
  }
}

class _TitleUser extends StatelessWidget {
  const _TitleUser({
    required this.text,
    required this.gender,
  });

  final String text;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Text(
      gender == "female" ? "Bienvenida $text" : "Bienvenido$text",
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}
