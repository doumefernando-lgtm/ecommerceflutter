import 'package:appecommerce/widget/input.dart';
import 'package:flutter/material.dart';

class PaiementPage extends StatefulWidget {
  const PaiementPage({super.key});

  @override
  State<PaiementPage> createState() => _PaiementPageState();
}

class _PaiementPageState extends State<PaiementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Passer à la caisse")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Votre Adresse",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Nom*", style: TextStyle(fontSize: 15)),
            Input(label: "Nom", hint: "Entrez un nom"),
            SizedBox(height: 10),
            Text("Télephone", style: TextStyle(fontSize: 15)),
            Input(label: "Télephone", hint: "Entrez votre téléphone"),
            SizedBox(height: 10),
            Text("Adresse", style: TextStyle(fontSize: 15)),
            Input(label: "adresse", hint: "Quartier par exemple"),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
