import 'package:flutter/material.dart';

// Modelo de datos para representar un post
class Post {
  final String username;
  final String content;
  final String imageUrl;

  Post(this.username, this.content, this.imageUrl);
}

// Lista de posts de ejemplo (puedes reemplazar esto con datos reales de tu base de datos)
final List<Post> posts = [
  Post('Cristian Alegre', '¡Hola a todos! Esto es un post de ejemplo.',
      '/images/1710741075_una-taza-de-javascript.png'),
  Post('Matha baez', '¡Bienvenidos a mi perfil!',
      '/images/1710744024_AVISO_DE_COBRO.jpg'),
  Post('programador x', '¿Qué tal su día?', '/images/1711038412_733332.jpg'),
];

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return _buildPostCard(context, posts[index]);
        },
      ),
    );
  }

  Widget _buildPostCard(BuildContext context, Post post) {
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 3.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('users/1710740814_e6d7d2c2c09bfc5b1aadbedbfdfbe435.jpg'), // Aquí puedes colocar la imagen de perfil del usuario
                  radius: 20.0,
                ),
                SizedBox(width: 8.0),
                Text(
                  post.username,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Image.asset(
              post.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200.0,
            ),
            SizedBox(height: 8.0),
            Text(
              post.content,
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {
                    // Lógica para dar "me gusta"
                  },
                  icon: Icon(Icons.thumb_up),
                  label: Text('Me gusta'),
                ),
                TextButton.icon(
                  onPressed: () {
                    // Lógica para comentar
                  },
                  icon: Icon(Icons.comment),
                  label: Text('Comentar'),
                ),
                TextButton.icon(
                  onPressed: () {
                    // Lógica para compartir
                  },
                  icon: Icon(Icons.share),
                  label: Text('Compartir'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PostsPage(),
  ));
}
