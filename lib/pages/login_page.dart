import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/providers/providers.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenSize.height * 0.2),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: screenSize.height * 0.6,
                  width: screenSize.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        20), // Ajusta el valor para cambiar el radio de esquina
                  ),
                  child: ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: _LoginForm(),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.2),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      FadeInDown(
        child: const Icon(
          Icons.lock,
          size: 100,
          color: Colors.grey,
        ),
      ),
      const Text("Inicia sesión en tu cuenta",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
      TextFormField(
        autofocus: false,
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        decoration:
            const InputDecoration(hintText: 'Correo Electrónico', filled: true),
        textAlign: TextAlign.center,
        onChanged: (value) => loginForm.email = value,
      ),
      TextFormField(
        autofocus: false,
        autocorrect: false,
        obscureText: true,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(hintText: 'Contraseña', filled: true),
        textAlign: TextAlign.center,
        onChanged: (value) => loginForm.password = value,
      ),
      FadeInUp(
          delay: const Duration(milliseconds: 700),
          from: 20,
          child: _LoginButton(loginForm: loginForm)),
    ]);
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    required this.loginForm,
  });

  final LoginFormProvider loginForm;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loginForm.isLoading
          ? null
          : () async {
              final userProvider =
                  Provider.of<UserProvider>(context, listen: false);

              loginForm.isLoading = true;
              final success = await userProvider.login(
                  loginForm.email, loginForm.password, context);

              if (success) {
                if (!context.mounted) return;
                Navigator.pushReplacementNamed(context, "home");
              }

              loginForm.isLoading = false;
            },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey, // Color de fondo del botón
        disabledBackgroundColor: Colors.grey, // Color de fondo del botón
        foregroundColor:
            Colors.white, // Color del texto del botón// Espaciado interno
        shape: RoundedRectangleBorder(
          // Forma del botón
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 20, // Elevación del botón
      ),
      child: _ButtonContent(loginForm: loginForm),
    );
  }
}

class _ButtonContent extends StatelessWidget {
  const _ButtonContent({
    required this.loginForm,
  });

  final LoginFormProvider loginForm;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Center(
        child: loginForm.isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : const Text(
                'Ingresar',
                style: TextStyle(fontSize: 20),
              ),
      ),
    );
  }
}
