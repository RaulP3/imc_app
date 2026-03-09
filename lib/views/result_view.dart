//Esta es la pantalla de los resultados

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lottie/lottie.dart';

class ResultView extends StatelessWidget {
  final double imc;
  final String resultado;

  const ResultView({super.key, required this.imc, required this.resultado});

  Color getColor() {
    if (resultado == "Normal") {
      return Colors.green;
    }
    if (resultado == "Sobrepeso") {
      return Colors.orange;
    }
    if (resultado == "Obesidad") {
      return Colors.red;
    }
    return Colors.blue;
  }

  String getMensaje() {
    if (resultado == "Normal") {
      return "Tu peso esta dentro del rango saludable.";
    }
    if (resultado == "Sobrepeso") {
      return "Se recomienda mejorar tu dieta y actividad fisica.";
    }
    if (resultado == "Obesidad") {
      return "Consulta con un especialista y mejora tus habitos.";
    }
    return "Debes mejorar tu alimentacion.";
  }

  void abrirVideo() async {
    final url = Uri.parse("https://www.youtube.com/watch?v=UBMk30rjy0o");

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Resultado"), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("IMC", style: Theme.of(context).textTheme.headlineSmall),

            Text(
              imc.toStringAsFixed(2),
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 40),

            Text(getMensaje(), textAlign: TextAlign.center),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: abrirVideo,
              child: const Text("Ver rutina de ejercicio"),
            ),

            //Aqui se agrega la animacion de Lottie
            Lottie.asset("assets/animations/exercise.json", height: 200),
          ],
        ),
      ),
    );
  }
}
