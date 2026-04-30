import 'package:flutter/material.dart';
import 'detail_screen.dart';

class NumbersScreen extends StatefulWidget {
  const NumbersScreen({super.key});

  @override
  State<NumbersScreen> createState() => _NumbersScreenState();
}

class _NumbersScreenState extends State<NumbersScreen> {

  List<Map<String, String>> numeros = List.generate(20, (index) {
    return {
      "numero": (index + 1).toString().padLeft(2, '0'),
      "estado": "Disponible"
    };
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Números')),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: numeros.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final item = numeros[index];

          return GestureDetector(
            onTap: () async {
              final resultado = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailScreen(numero: item),
                ),
              );

              if (resultado == true) {
                setState(() {
                  numeros[index]["estado"] = "Reservado";
                });
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: item["estado"] == "Disponible"
                    ? Colors.green
                    : Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  item["numero"]!,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}