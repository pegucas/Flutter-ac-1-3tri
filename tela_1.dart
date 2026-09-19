import 'package:flutter/material.dart';

import 'tela_2.dart';

class TelaInicial extends StatelessWidget {
  TelaInicial({super.key});

  final nomecapitao = TextEditingController();
  final tripulacao = TextEditingController();
  final distancia = TextEditingController();

  // Função para abrir a segunda tela
  void abrirSegundaTela(BuildContext context) {
    final nomecap = nomecapitao.text.trim();
    final trip = int.tryParse(tripulacao.text) ?? 0;
    final dist = double.tryParse(distancia.text) ?? 0;

    // Validação de valores
    if (nomecap.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "O nome do capitão não pode ser vazio (Voce não é o Orlandes Voador Espacial)",
          ),
        ),
      );
      return;
    } else if (trip <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "A tripulação é menor ou igual a 0 mude ela (Pera tu tem um morto? E voce não consta?)",
          ),
        ),
      );
      return;
    } else if (dist <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "A distancia é menor ou igual a 0 (Vai andando ou entra no buraco negro logo de uma vez)",
          ),
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            SegundaTela(nomecap: nomecap, trip: trip, dist: dist),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculador estupidamente complexa de foguetes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            // Campo de texto para o nome do capitão
            TextField(
              controller: nomecapitao,
              decoration: const InputDecoration(
                labelText: "Digite o nome do capitão: ",
              ),
            ),
            const SizedBox(height: 20),

            // Campo de texto para a tripulação
            TextField(
              controller: tripulacao,
              decoration: const InputDecoration(
                labelText: "Digite a tripulação: ",
              ),
            ),
            const SizedBox(height: 20),

            // Campo de texto para a distância
            TextField(
              controller: distancia,
              decoration: const InputDecoration(
                labelText: "Digite a distancia em Anos-Luz: ",
              ),
            ),
            const SizedBox(height: 20),

            //botão para abrir a segunda tela
            ElevatedButton(
              onPressed: () {
                abrirSegundaTela(context);
              },
              child: const Text("Ir para recursos"),
            ),
          ],
        ),
      ),
    );
  }
}
