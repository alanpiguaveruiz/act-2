import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, String> numero;

  const DetailScreen({super.key, required this.numero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Número: ${numero["numero"]}",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text("Estado: ${numero["estado"]}"),
            const SizedBox(height: 30),

            ElevatedButton(
              child: const Text("Reservar"),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Confirmación"),
                    content: const Text("¿Deseas reservar este número?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancelar"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context, true);
                        },
                        child: const Text("Confirmar"),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}