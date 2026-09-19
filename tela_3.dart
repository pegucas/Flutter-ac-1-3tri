import 'package:flutter/material.dart';

import 'tela_4.dart';

class TerceiraTela extends StatelessWidget {
  final String nomecap;
  final int trip;
  final double dist;
  final int diasViagem;
  final double precoCombustivel;
  final double custoOxigenio;
  final double orcamentoTotalnecessario;

  TerceiraTela({
    super.key,
    required this.nomecap,
    required this.trip,
    required this.dist,
    required this.diasViagem,
    required this.precoCombustivel,
    required this.custoOxigenio,
    required this.orcamentoTotalnecessario,
  });

  final orcamentoDisponivel = TextEditingController();
  final percentualDeVelocidade = TextEditingController();

  void irParaTela4(BuildContext context) {
    final orcamentoDisponivelValor = double.tryParse(orcamentoDisponivel.text) ?? 0;
    final percentualDeVelocidadeValor = double.tryParse(percentualDeVelocidade.text) ?? 0;

    double saldoFinal = orcamentoDisponivelValor - orcamentoTotalnecessario;
    double fatorDesgaste = (percentualDeVelocidadeValor / 10) * diasViagem;

    if (percentualDeVelocidadeValor <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "O percentual de velocidade deve ser maior que zero e menor ou igual a 100 (Não tente quebrar as leis da física).",
          ),
        ),
      );
      return;
    }else if (percentualDeVelocidadeValor > 100) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "O percentual de velocidade deve ser menor ou igual a 100 (Nenhuma nave pode ultrapassar a velocidade da luz).",
          ),
        ),
      );
      return;
    }else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuartaTela(
            nomecap: nomecap,
            trip: trip,
            dist: dist,
            diasViagem: diasViagem,
            precoCombustivel: precoCombustivel,
            custoOxigenio: custoOxigenio,
            orcamentoTotalnecessario: orcamentoTotalnecessario,
            orcamentoDisponivel: orcamentoDisponivelValor,
            saldoFinal: saldoFinal,
            percentualDeVelocidade: percentualDeVelocidadeValor,
            fatorDesgaste: fatorDesgaste,
            riscoPane: percentualDeVelocidadeValor >= 80,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Velocidades e afins")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextField(
              controller: percentualDeVelocidade,
              decoration: const InputDecoration(
                labelText: "Percentual de velocidade (De 0 a 100):",
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: orcamentoDisponivel,
              decoration: const InputDecoration(
                labelText: "Orçamento disponível pelo governo:",
              ),
            ),

            ElevatedButton(
              onPressed: () {
                irParaTela4(context);
              },
              child: const Text("Ir para tela quatro"),
            ),
          ],
        ),
      ),
    );
  }
}
