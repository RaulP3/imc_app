// Aqui se conecta la vista con el modelo

import '../models/imc_mod.dart';

class IMCCon {
  final IMCModel _model = IMCModel();

  double calcularIMC(double peso, double altura) {
    return _model.calcularIMC(peso, altura);
  }

  String obtenerClasificacion(double imc) {
    return _model.clasificacion(imc);
  }
}
