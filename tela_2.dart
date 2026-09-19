import 'package:flutter/material.dart';

import 'tela_3.dart';

class SegundaTela extends StatelessWidget {
  final String nomecap;
  final int trip;
  final double dist;

  SegundaTela({
    super.key,
    required this.nomecap,
    required this.trip,
    required this.dist,
  });

  final diasViagem = TextEditingController();
  final precoCombustivel = TextEditingController();

  // Função dos calculos
  void irParaTela3(BuildContext context) {
    //Tranformação de valores
    final diasViagemValor = int.tryParse(diasViagem.text) ?? 0;
    final precoCombustivelValor = double.tryParse(precoCombustivel.text) ?? 0;

    // Validação de valores
    if (diasViagemValor <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "O número de dias deve ser maior que zero (Viagem no tempo ainda não é possível).",
          ),
        ),
      );
      return;
    } else if (precoCombustivelValor <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "O preço do combustível deve ser maior que zero (Tu ganha ao colocar combustivel?).",
          ),
        ),
      );
      return;
    }

    // Cálculos
    double custoTotal = (dist * trip) * 1000;
    double custoCombustivel = custoTotal * precoCombustivelValor;
    double racaoOxigenio = trip * diasViagemValor * 2.5;
    double custoOxigenio = racaoOxigenio * 50;
    double orcamentoTotalnecessario = custoCombustivel + custoOxigenio;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => TerceiraTela(
          nomecap: nomecap,
          trip: trip,
          dist: dist,
          diasViagem: diasViagemValor,
          precoCombustivel: precoCombustivelValor,
          custoOxigenio: custoOxigenio,
          orcamentoTotalnecessario: orcamentoTotalnecessario,
        ),
      ),
    );
  }

  // Front-end
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("O MY GOD GASOSA TA CARA")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Texto para os dias de viagem
            TextField(
              controller: diasViagem,
              decoration: const InputDecoration(
                labelText: "Digite os dias estimados para essa viagem: ",
              ),
            ),
            const SizedBox(height: 20),

            //Texto para o preço do combustivel
            TextField(
              controller: precoCombustivel,
              decoration: const InputDecoration(
                labelText: "Digite o custo de combustivel espacial por kilo em dolar hoje: ",
              ),
            ),
            const SizedBox(height: 20),

            //botão para ir para a tela 3
            ElevatedButton(
              onPressed: () {
                irParaTela3(context);
              },
              child: const Text("Ir para tela tres"),
            ),
          ],
        ),
      ),
    );
  }
}
