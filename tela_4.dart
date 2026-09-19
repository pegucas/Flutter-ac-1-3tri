import 'package:flutter/material.dart';
import 'package:telas_ac/tela_1.dart';

class QuartaTela extends StatelessWidget {
  final String nomecap;
  final int trip;
  final double dist;
  final int diasViagem;
  final double precoCombustivel;
  final double custoOxigenio;
  final double orcamentoTotalnecessario;
  final double orcamentoDisponivel;
  final double saldoFinal;
  final double percentualDeVelocidade;
  final double fatorDesgaste;
  final bool riscoPane;

  const QuartaTela({
    super.key,
    required this.nomecap,
    required this.trip,
    required this.dist,
    required this.diasViagem,
    required this.precoCombustivel,
    required this.custoOxigenio,
    required this.orcamentoTotalnecessario,
    required this.orcamentoDisponivel,
    required this.saldoFinal,
    required this.percentualDeVelocidade,
    required this.fatorDesgaste,
    required this.riscoPane,
  });

  void resetarTudo(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => TelaInicial(),
      ),
    );
  }

  void voltar(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sumário da missão")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text("Nome do Capitão: $nomecap"),
            Text("Tripulação: $trip"),
            Text("Distância: $dist Anos-Luz"),
            Text("Dias de Viagem: $diasViagem"),
            Text("Preço do Combustível: $precoCombustivel"),
            Text("Custo de Oxigênio: $custoOxigenio"),
            Text("Orçamento Total Necessário: $orcamentoTotalnecessario"),
            Text("Orçamento Disponível: $orcamentoDisponivel"),
            Text("Saldo Final: $saldoFinal"),
            Text("Percentual de Velocidade: $percentualDeVelocidade%"),
            Text("Fator de Desgaste: $fatorDesgaste"),
            Text("Risco de Pane:"),
            Text(riscoPane ? "Sim" : "Não"),
            if (saldoFinal < 0)
              const Text(
                "Saldo Negativo possivel falha na missão.",
                style: TextStyle(color: Colors.red),
              ),

            if (saldoFinal > 0)
              const Text(
                "Saldo Positivo, a missão tem chances de sucesso.",
                style: TextStyle(color: Colors.green),
              ),

              ElevatedButton(
              onPressed: () {
                resetarTudo(context);
              },
              child: const Text("Resetar Tudo"),
            ),

            ElevatedButton(
              onPressed: () {
                voltar(context);
              },
              child: const Text("Voltar"),
            ),
          ],
        ),
      ),
    );
  }
}
