//Esto es lo que vera el usuario

import 'package:flutter/material.dart';
import '../controller/imc_con.dart';

class IMCVista extends StatefulWidget {
  const IMCVista({super.key});

  @override
  State<IMCVista> createState() => _IMCVistaState();
}

class _IMCVistaState extends State<IMCVista> {
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();

  final IMCCon controller = IMCCon();

  double imc = 0;
  String resultado = "";

  void calcular() {
    double peso = double.parse(pesoController.text);
    double altura = double.parse(alturaController.text);

    double calculo = controller.calcularIMC(peso, altura);
    String clasificacion = controller.obtenerClasificacion(calculo);

    setState(() {
      imc = calculo;
      resultado = clasificacion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Peso (kg)"),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Altura (cm)"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: calcular,
              child: const Text("Calcular IMC"),
            ),

            const SizedBox(height: 30),

            if (imc > 0)
              Column(
                children: [
                  Text(
                    "IMC: ${imc.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 30),
                  ),

                  Text(resultado, style: const TextStyle(fontSize: 20)),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
