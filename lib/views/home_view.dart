//Esta es la pantalla principal del formulario
import 'package:flutter/material.dart';
import '../controller/imc_con.dart';
import 'result_view.dart';
import 'package:flutter/services.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double altura = 170;
  int peso = 70;
  int edad = 25;

  int genero = 0;

  final IMCCon controller = IMCCon();

  void calcularIMC() {
    double imc = controller.calcularIMC(peso.toDouble(), altura);
    String clasificacion = controller.obtenerClasificacion(imc);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultView(imc: imc, resultado: clasificacion),
      ),
    );
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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ChoiceChip(
                  label: const Text("Hombre"),
                  selected: genero == 0,
                  onSelected: (_) {
                    setState(() {
                      genero = 0;
                    });
                  },
                ),

                ChoiceChip(
                  label: const Text("Mujer"),
                  selected: genero == 1,
                  onSelected: (_) {
                    setState(() {
                      genero = 1;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 30),

            Card(
              child: Column(
                children: [
                  Text("Altura: ${altura.round()} cm"),

                  Slider(
                    min: 100,
                    max: 220,
                    value: altura,
                    onChanged: (value) {
                      HapticFeedback.selectionClick(); //Vibracion al seleccionar
                      setState(() {
                        altura = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text("Peso"),

                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              peso--;
                            });
                          },
                        ),

                        Text("$peso"),

                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              peso++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),

                Column(
                  children: [
                    const Text("Edad"),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              edad--;
                            });
                          },
                        ),

                        Text("$edad"),

                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              edad++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: calcularIMC,
                child: const Text("Calcular IMC"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
