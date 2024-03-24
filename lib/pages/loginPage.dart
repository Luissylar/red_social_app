import 'package:flutter/material.dart';
import 'package:red_social/pages/ForgotPasswordPage.dart';
import 'package:red_social/pages/posts/index.dart';
import 'package:red_social/pages/register.dart';
// La importación de 'package:flutter/rendering.dart' parece no ser necesaria aquí.

// Declara los controladores de texto fuera de la clase del widget
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Social Dev"),
          leading: Icon( // Icono como logotipo de red social
            Icons.face_2, // Cambia a cualquier icono que desees usar como logotipo de red social
            size: 32, // Tamaño del icono
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _inputField(context),
              _loginButton(context),
              _forgotPassword(context),
              _signup(context)
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
          "INICIO DE SESIÓN",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(
          "La red Social de todas y todes",
        ),
      ],
    );
  }

  Widget _inputField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _emailController, // Asigna el controlador al campo de texto de email
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
        SizedBox(height: 10,),
        TextField(
          controller: _passwordController, // Asigna el controlador al campo de texto de contraseña
          decoration: InputDecoration(
            hintText: "Contraseña",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(28)),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.lock_outline),
          ),
          obscureText:true,
        ),
      ],
    );
  }

  Widget _loginButton(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(Icons.login),
      label: Text(
        'Iniciar Sesión',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      onPressed: () {
        // Lógica de verificación de los campos de entrada
        if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
          // Mostrar un modal si los campos están vacíos
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Campos Incompletos'),
              content: Text('Por favor, complete todos los campos.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cerrar'),
                ),
              ],
            ),
          );
        } else if (!isValidEmail(_emailController.text)) {
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
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PostsPage()),
          );
          }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        minimumSize: Size(150, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
      ),
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Navegar a la página de registro
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
        );
      },
      child: Text('Olvidé mi contraseña'),
    );
  }

  Widget _signup(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      // Navegar a la página de registro
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RegisterPage()),
      );
    },
    child: Text('Registrarse'),
  );
}


  // Función para validar un correo electrónico
  bool isValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }
}
