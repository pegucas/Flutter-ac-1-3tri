import 'dart:ffi';

import 'package:flutter/material.dart';
import 'tela_terciaria.dart';

class SegundaTela extends StatelessWidget {
  final String nomecap;
  final Int tripulacao;
  final Double distancia;

  const SegundaTela({super.key, required this.nomecap, required this.tripulacao, required this.distancia});

  void voltarTela(BuildContext context) {
    Navigator.pop(context);
  }

  void seguir(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => TelaTerciaria()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Segunda Tela")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Nome do Hotel: $nomecap", style: const TextStyle(fontSize: 25)),

            Text(
              "Quantidade de Diarias: $tripulacao",
              style: const TextStyle(fontSize: 25),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                voltarTela(context);
              },
              child: const Text("Voltar"),
            ),

            ElevatedButton(
              onPressed: () {
                seguir(context);
              },
              child: const Text("Prosseguir"),
            ),
          ],
        ),
      ),
    );
  }
}
