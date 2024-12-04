import 'package:flutter/material.dart';
import 'package:prueba_001/main.dart';
import 'package:prueba_001/screens/ejercicio1.dart';
import 'package:prueba_001/screens/ejercicio2.dart';

class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Inicio"),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Prueba())),
          ),
          ListTile(
            title: Text("Ejercicio 1"),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Ejercicio1())),
          ),
          ListTile(
            title: Text("Ejercicio 2"),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Ejercicio2())),
          ),
        ],
      ),
    );
  }
}
