import 'package:flutter/material.dart';
import 'package:prueba_tecnica/pages/pages.dart';
import 'package:prueba_tecnica/providers/providers.dart';
import 'package:prueba_tecnica/services/services.dart';
import 'package:prueba_tecnica/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserProvider()),
    ChangeNotifierProvider(create: (_) => AuthService()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: myTheme,
        initialRoute: 'check',
        scaffoldMessengerKey: NotificationsService.messengerKey,
        routes: {
          'login': (_) => const LoginPage(),
          'home': (_) => const HomePage(),
          'check': (_) => const CheckAuthScreen(),
        },
        home: const LoginPage());
  }
}
