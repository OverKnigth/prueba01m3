import 'package:flutter/material.dart';
import 'package:prueba_001/navegadores/drawer.dart';
import 'package:prueba_001/screens/ejercicio2.dart';

void main() {
  runApp(Prueba());
}

class Prueba extends StatelessWidget {
  const Prueba({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prueba Nº 1",
            style: TextStyle(color: Colors.white, fontSize: 30)),
        backgroundColor: Colors.green.shade900,
      ),
      drawer: MiDrawer(),
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.network(
            "https://fondosanimados.com/wp-content/uploads/2023/03/Pinwheel-Forest_wallpaper-1920x1080.jpg",
            fit: BoxFit.cover,
          )),
          Center(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Nombre: Stalin Moposita",
                    style: TextStyle(fontSize: 30, color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("GitHub: OverKnigth",
                    style: TextStyle(fontSize: 30, color: Colors.white)),
              ),
              pagina_btn(context)
            ]),
          )
        ],
      ),
    );
  }
}

Widget pagina_btn(context) {
  return ElevatedButton.icon(
      onPressed: () => navegar2(context),
      label: Text("Ir a Ejercicios"),
      icon: Icon(Icons.arrow_circle_right_outlined));
}

void navegar2(context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => Ejercicio2()));
}
