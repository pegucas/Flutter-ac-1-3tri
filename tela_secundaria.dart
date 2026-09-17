  import 'package:flutter/material.dart';
  import 'tela_terciaria.dart';

  class SegundaTela extends StatelessWidget {
    final String nomecap;
    final int trip;
    final double dist;
    final diasViagem = TextEditingController();
    final custoCombustivel = TextEditingController();

    SegundaTela({super.key, required this.nomecap, required this.trip, required this.dist});

    void seguir(BuildContext context) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TelaTerciaria()),
      );
    }

    void contas(){

    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text("O MY GOD GASOSA TA CARA")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              TextField(
              controller: diasViagem,
              decoration: const InputDecoration(
                labelText: "Digite os dias estimados para essa viagem: ",
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: custoCombustivel,
              decoration: const InputDecoration(
                labelText: "Digite o custo de combustivel espacial em dolar hoje: ",
              ),
            ),
            const SizedBox(height: 20),
            ],
          ),
        ),
      );
    }
  }
