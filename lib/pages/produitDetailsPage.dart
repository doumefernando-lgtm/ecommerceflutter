import 'package:appecommerce/pages/panier.dart';
import 'package:appecommerce/widget/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProduitDetailsPage extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProduitDetailsPage({super.key, required this.product});

  @override
  State<ProduitDetailsPage> createState() => _ProduitDetailsPageState();
}

class _ProduitDetailsPageState extends State<ProduitDetailsPage> {
  int quantite = 1;

  @override
  Widget build(BuildContext context) {
    String image = widget.product['image_url'] ?? "assets/images/frigo.jpg";
    return Scaffold(
      appBar: AppBar(title: Text(widget.product["name"])),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              child: PageView.builder(
                itemCount: 1,
                itemBuilder: (context, index) =>
                    Image.asset(image, fit: BoxFit.contain),
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.product["name"],
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "${widget.product["price"]}FCFA",
              style: TextStyle(fontSize: 22, color: Colors.orange),
            ),
            SizedBox(height: 10),
            widget.product["stock"] >= 1
                ? Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green, size: 22),
                      Text("En stock"),
                    ],
                  )
                : Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.red, size: 22),
                      Text("En rupture"),
                    ],
                  ),
            SizedBox(height: 10),
            Text(
              "Description",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(widget.product["description"]),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: Row(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (quantite > 1) {
                      setState(() {
                        quantite--;
                      });
                    }
                  },
                  icon: Icon(Icons.remove),
                ),
                Text(quantite.toString()),
                IconButton(
                  onPressed: () {
                    setState(() {
                      quantite++;
                    });
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),

            SizedBox(width: 20),

            Expanded(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: () {
                  Provider.of<CartProvider>(
                    context,
                    listen: false,
                  ).addProduct(widget.product, quantite);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PanierPage()),
                  );
                },
                icon: Icon(Icons.shopping_cart),
                label: Text(
                  "AJOUTER AU PANIER",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
