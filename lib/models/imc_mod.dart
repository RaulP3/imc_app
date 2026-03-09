//Esta parte contiene la logica matematica del IMC
class IMCModel {
  //Calculo de IMC
  double calcularIMC(double peso, double altura) {
    double alturaMetros = altura / 100;
    return peso / (alturaMetros * alturaMetros);
  }

  //Asignamos los valores para la clasificacion
  String clasificacion(double imc) {
    if (imc < 18.5) {
      return "Bajo peso";
    } else if (imc < 25) {
      return "Peso normal";
    } else if (imc < 30) {
      return "sobrepeso";
    } else {
      return "Obesidad";
    }
  }
}
