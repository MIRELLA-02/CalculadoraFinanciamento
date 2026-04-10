import 'dart:math';
import 'package:flutter/material.dart';

class Produtos extends StatefulWidget {
  const Produtos({super.key});

  @override
  State<Produtos> createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  double valorBem = 0.0;
  double numeroParcelas = 0.0;
  double taxaJurosMensal = 0.0;
  double taxaAdicional = 0.0;

  double montanteFinal() {
    return valorBem * pow((1 + taxaJurosMensal), numeroParcelas) +
        taxaAdicional;
  }

  double valorParcela() {
    if (numeroParcelas == 0) return 0;
    return montanteFinal() / numeroParcelas;
  }

  void resultado() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Resultado"),
        content: Text(
          "Montante: ${montanteFinal().toStringAsFixed(2)}\n"
          "Parcela: ${valorParcela().toStringAsFixed(2)}",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 68, 168),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              "Simulador de financiamento",
              style: TextStyle(
                fontSize: 26,
                color: const Color.fromARGB(255, 146, 211, 244),
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              "Valor do financiamento:",
              style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Digite o valor...",
                hintStyle: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: (value) {
                valorBem = double.parse(value);
              },
            ),

            Text(
              "Taxa de juros ao mês:",
              style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Digite a taxa...",
                hintStyle: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: (value) {
                taxaJurosMensal = double.parse(value) / 100;
              },
            ),

            Text(
              "Número de parcelas:",
              style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Digite as parcelas...",
                hintStyle: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: (value) {
                numeroParcelas = double.parse(value);
              },
            ),

            Text(
              "Demais taxas e custos:",
              style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Digite o total de taxas..",
                hintStyle: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: (value) {
                taxaAdicional = double.parse(value);
              },
            ),

            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      foregroundColor: Color.fromARGB(255, 152, 190, 246),
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: resultado,
                    child: Text("Calcular"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color.fromARGB(255, 163, 199, 253),
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Text("Sair"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
