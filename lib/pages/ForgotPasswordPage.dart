import 'package:flutter/material.dart';

// Declara los controladores de texto fuera de la clase del widget
final TextEditingController _emailController = TextEditingController();

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Social Dev"),
          leading: Icon(
            Icons.face_2,
            size: 32,
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _header(context),
              _inputField(context),
              _resetButton(context),
              _backToLogin(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Column(
      children: [
        Text(
          "¿Olvidaste tu contraseña?",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          "Introduce tu correo electrónico para recuperar tu contraseña",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _inputField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            hintText: "Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(28)),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.person_outline),
          ),
        ),
      ],
    );
  }

  Widget _resetButton(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    child: ElevatedButton(
      onPressed: () {
        // Lógica para enviar correo de recuperación
        String email = _emailController.text;
        if (isValidEmail(email)) {
          // Aquí podrías implementar la lógica para enviar el correo de recuperación
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Correo Enviado'),
              content: Text('Se ha enviado un correo de recuperación a $email'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cerrar'),
                ),
              ],
            ),
          );
        } else {
          // Mostrar un modal si el email no es válido
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Email Inválido'),
              content: Text('Por favor, introduzca un email válido.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cerrar'),
                ),
              ],
            ),
          );
        }
      },
      child: Text('Recuperar Contraseña'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        minimumSize: Size(150, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
      ),
    ),
  );
}


  Widget _backToLogin(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: TextButton(
        onPressed: () {
          // Navegar de vuelta a la página de inicio de sesión
          Navigator.pop(context);
        },
        child: Text('Volver al inicio de sesión'),
      ),
    );
  }


  // Función para validar un correo electrónico
  bool isValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }
}

void main() {
  runApp(MaterialApp(
    home: ForgotPasswordPage(),
  ));
}
