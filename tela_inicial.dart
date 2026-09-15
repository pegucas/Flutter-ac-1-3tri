import 'package:flutter/material.dart';
import 'tela_secundaria.dart';

class TelaInicial extends StatelessWidget {
  TelaInicial({super.key});

  final nomecap = TextEditingController();
  final tripulacao = TextEditingController();
  final distancia = TextEditingController();

  void abrirSegundaTela(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            SegundaTela(
              nomecap: nomecap.text,
              tripulacao: int.parse(tripulacao.text), 
              distancia: distancia.text
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tela Inicial")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nomecap,
              decoration: const InputDecoration(
                labelText: "Digite o nome do capitão: ",
              ),
            ),

            TextField(
              controller: tripulacao,
              decoration: const InputDecoration(
                labelText: "Digite a tripulação: ",
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: distancia,
              decoration: const InputDecoration(
                labelText: "Digite a distancia em Anos-Luz: ",
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                abrirSegundaTela(context);
              },
              child: const Text("Enviar"),
            ),
          ],
        ),
      ),
    );
  }
}
