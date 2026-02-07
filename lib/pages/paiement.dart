import 'package:appecommerce/pages/facturePage.dart';
import 'package:appecommerce/widget/cart_provider.dart';
import 'package:appecommerce/widget/input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaiementPage extends StatefulWidget {
  const PaiementPage({super.key});

  @override
  State<PaiementPage> createState() => _PaiementPageState();
}

class _PaiementPageState extends State<PaiementPage> {
  final _fromKey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _telephoneController = TextEditingController();
  final _adresseController = TextEditingController();
  @override
  void dispose() {
    _nomController.dispose();
    _telephoneController.dispose();
    _adresseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Passer à la caisse",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Votre Adresse",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),

              Form(
                key: _fromKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nom*", style: TextStyle(fontSize: 15)),
                    Input(
                      label: "Nom",
                      hint: "Entrez votre nom",
                      controller: _nomController,
                    ),
                    SizedBox(height: 10),
                    Text("Télephone*", style: TextStyle(fontSize: 15)),
                    Input(
                      label: "téléphone",
                      hint: "Entrer votre téléphone",
                      controller: _telephoneController,
                    ),
                    SizedBox(height: 10),
                    Text("Adresse", style: TextStyle(fontSize: 15)),
                    Input(
                      label: "adresse",
                      hint: "Entrez le nom du quartier",
                      controller: _adresseController,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              Text(
                "A Payer",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black12, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${cart.total.toInt()}FCFA",
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text("Paiement à la livraison"),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsetsGeometry.only(top: 50),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_fromKey.currentState!.validate()) {
                        String name = _nomController.text;
                        String telephone = _telephoneController.text;
                        String adresse = _adresseController.text;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FacturePage(
                              name: name,
                              telephone: telephone,
                              adresse: adresse,
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 50),
                      backgroundColor: Colors.orange,
                    ),
                    child: Text(
                      "COMMANDER",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
