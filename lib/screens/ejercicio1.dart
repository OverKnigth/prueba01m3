import 'package:flutter/material.dart';
import 'package:prueba_001/navegadores/drawer.dart';

class Ejercicio1 extends StatelessWidget {
  const Ejercicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ejercicio 1",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: Colors.cyan.shade300,
      ),
      drawer: MiDrawer(),
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            "assets/images/fondo1.jpg",
            fit: BoxFit.cover,
          )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Calculadora de Altura",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, 
                  ),
                ),
                const SizedBox(height: 20),
                alturaInput(),
                const SizedBox(height: 16),
                tiempoInput(),
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

// Controladores
TextEditingController alturaInicialController = TextEditingController();
TextEditingController tiempoController = TextEditingController();

Widget alturaInput() {
  return TextField(
    controller: alturaInicialController,
    decoration: const InputDecoration(
      labelText: "Altura Inicial (hi) en metros",
      border: OutlineInputBorder(),
      filled: true,
      fillColor: Colors.white70, 
    ),
    keyboardType: TextInputType.number,
  );
}

Widget tiempoInput() {
  return TextField(
    controller: tiempoController,
    decoration: const InputDecoration(
      labelText: "Tiempo (t) en segundos",
      border: OutlineInputBorder(),
      filled: true,
      fillColor: Colors.white70, 
    ),
    keyboardType: TextInputType.number,
  );
}

Widget calcularButton(context) {
  return Center(
    child: ElevatedButton(
      onPressed: () => calcularAltura(context),
      child: const Text("Calcular Altura"),
    ),
  );
}

void calcularAltura(BuildContext context) {
  final double? hi = double.tryParse(alturaInicialController.text);
  final double? t = double.tryParse(tiempoController.text);

  if (hi == null || t == null) {
    mostrarResultado(context, "Error", "Por favor, ingresa valores válidos.");
    return;
  }

  const double aceleracion = 20.0;

  double altura = hi + (0.5 * aceleracion * t * t);

  if (altura >= 1000) {
    mostrarResultado(context, "Lanzamiento Exitoso",
        "La altura alcanzada es de ${altura.toStringAsFixed(2)} m");
  } else {
    mostrarResultado(context, "Lanzamiento Fallido",
        "La altura alcanzada es de ${altura.toStringAsFixed(2)} m");
  }
}

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

Widget imgL() {
  return Image.asset("assets/images/fondo1.jpg", width: 300, height: 300);
}
