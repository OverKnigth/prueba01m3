import 'package:flutter/material.dart';
import 'package:prueba_001/navegadores/drawer.dart';

class Ejercicio2 extends StatelessWidget {
  const Ejercicio2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ejercicio 2",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: Colors.green.shade900,
      ),
      drawer: MiDrawer(),
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.network(
              "https://images.squarespace-cdn.com/content/v1/5fe4caeadae61a2f19719512/128c95a2-f303-434d-8c9f-1237c027b199/Pok%C3%A9mon+Emerald+-+waterfall",
              fit: BoxFit.cover,
            ),
          ),
          // Contenido del cálculo
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Cálculo de Distancia Recorrida",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color:
                        Colors.white, // Texto en blanco para mejor visibilidad
                  ),
                ),
                const SizedBox(height: 20),
                velocidadAngularInput(),
                const SizedBox(height: 20),
                calcularButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Controlador para el campo de entrada
TextEditingController velocidadAngularController = TextEditingController();

// Widget de entrada para la velocidad angular
Widget velocidadAngularInput() {
  return TextField(
    controller: velocidadAngularController,
    decoration: const InputDecoration(
      labelText: "Velocidad Angular (w) en rad/s",
      border: OutlineInputBorder(),
      filled: true,
      fillColor: Colors.white70, // Fondo semi-transparente para visibilidad
    ),
    keyboardType: TextInputType.number,
  );
}

// Botón para calcular
Widget calcularButton(BuildContext context) {
  return Center(
    child: ElevatedButton(
      onPressed: () => calcularDistancia(context),
      child: const Text("Calcular Distancia"),
    ),
  );
}

// Función para calcular la distancia y mostrar el resultado
void calcularDistancia(BuildContext context) {
  const double tiempo = 25.0; // Tiempo predeterminado en segundos
  final double? w = double.tryParse(velocidadAngularController.text);

  if (w == null) {
    mostrarResultado(context, "Error",
        "Por favor, ingresa un valor válido para la velocidad angular.");
    return;
  }

  // Cálculo de la distancia recorrida
  double distancia = w * tiempo;

  mostrarResultado(context, "Resultado",
      "La distancia recorrida es de ${distancia.toStringAsFixed(2)} radianes.");
}

// Función para mostrar un AlertDialog
void mostrarResultado(BuildContext context, String titulo, String mensaje) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(titulo),
        content: Text(mensaje),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cerrar"),
          ),
        ],
      );
    },
  );
}
