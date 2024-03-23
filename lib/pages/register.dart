import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
              _registerButton(context),
              _backButton(context), // Agrega el botón de regreso
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
          "Registro",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(
          "Crear una nueva cuenta",
        ),
      ],
    );
  }

  Widget _inputField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Nombres", // Campo para nombres
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
          decoration: InputDecoration(
            hintText: "Apellidos", // Campo para apellidos
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(28)),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.person),
          ),
        ),
        SizedBox(height: 10,),
        TextField(
          decoration: InputDecoration(
            hintText: "Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(28)),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.email),
          ),
        ),
        SizedBox(height: 10,),
        TextField(
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

  Widget _registerButton(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(Icons.person_add),
      label: Text(
        'Registrarse',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      onPressed: () {
        // Lógica de registro
        print("Registrando nuevo usuario...");
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
      ),
    );
  }

  Widget _backButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pop(context); // Regresar a la página anterior
      },
      child: Text('Regresar'),
    );
  }
}
