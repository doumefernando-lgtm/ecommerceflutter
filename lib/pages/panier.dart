import 'package:appecommerce/widget/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PanierPage extends StatefulWidget {
  const PanierPage({super.key});

  @override
  State<PanierPage> createState() => _PanierPageState();
}

class _PanierPageState extends State<PanierPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mon panier"),
        backgroundColor: Colors.orange,
      ),
      body: cart.items.isEmpty
          ? Center(child: Text("Votre Pnier est vide"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      final product = item["product"];

                      return Card(
                        margin: const EdgeInsets.all(8),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                product["image_url"] ??
                                    "assets/images/frigo.jpg",
                                height: 70,
                                width: 70,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product["name"],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "${product["price"]}FCFA",
                                    style: const TextStyle(
                                      color: Colors.orange,
                                    ),
                                  ),

                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () => cart.decrement(index),
                                        icon: Icon(Icons.remove),
                                      ),
                                      SizedBox(width: 5),
                                      Text("${item["quantite"]}"),
                                      IconButton(
                                        onPressed: () => cart.increment(index),
                                        icon: Icon(Icons.add),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 5),
                    ],
                  ),
                  child: Column(
                    children: [
                      _ligne("Sous-total", cart.total),
                      _ligne("Frais de livraison", 0),
                      const Divider(),
                      _ligne("Montant à payer", cart.total, bold: true),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Passer à la caisse",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _ligne(String titre, double montant, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titre,
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            "${montant.toInt()} FCFA",
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
