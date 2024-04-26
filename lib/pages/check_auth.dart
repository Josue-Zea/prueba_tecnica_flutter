import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/pages/pages.dart';
import 'package:prueba_tecnica/providers/providers.dart';

class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: userProvider.loginToken(),
            builder: (_, AsyncSnapshot<String> snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox(
                    width: 150,
                    height: 150,
                    child: Image(image: AssetImage('assets/loading.gif')));
              }

              if (snapshot.data == "") {
                Future.microtask(() {
                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const LoginPage(),
                          transitionDuration: const Duration(seconds: 0)));
                });
              } else {
                Future.microtask(() {
                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const HomePage(),
                          transitionDuration: const Duration(seconds: 0)));
                });
              }

              return Container();
            }),
      ),
    );
  }
}
