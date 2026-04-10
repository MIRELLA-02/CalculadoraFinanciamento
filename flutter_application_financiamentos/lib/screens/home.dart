import 'package:flutter/material.dart';
import 'produtos.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/financiamento.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 147, 221, 255),
              foregroundColor: Color.fromARGB(255, 0, 0, 0),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 18),
              textStyle: TextStyle(fontSize: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0,
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Produtos()),
            ),
            child: Text("Calcular"),
          ),
        ),
      ),
    );
  }
}
