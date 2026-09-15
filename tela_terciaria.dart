import 'package:flutter/material.dart';
import 'tela_inicial.dart';

class TelaTerciaria extends StatelessWidget {
  TelaTerciaria({super.key});

  void voltarTudo(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => TelaInicial()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tela tres")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Reserva realizada com exito!!!"),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                voltarTudo(context);
              },
              child: const Text("Voltar"),
            ),
          ],
        ),
      ),
    );
  }
}
