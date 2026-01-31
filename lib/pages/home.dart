import 'package:appecommerce/pages/produitDetailsPage.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final List<Map<String, dynamic>> produits = [
    {
      "category_id": 1,
      "name": "Refrigirateur",
      "price": 20000,
      "description":
          "Dites à votre réfrigérateur exactement ce dont vous avez besoin, quand vous en avez besoin. Dites « Active Express Freeze » et le haut-parleur AI écoute et s'assure que vos courses sont prises en charge.",
      "stock": 20,
      "image_url": "assets/images/frigo.jpg",
    },
    {
      "category_id": 2,
      "name": "Mixeur",
      "price": 20500,
      "description":
          "Dites à votre réfrigérateur exactement ce dont vous avez besoin, quand vous en avez besoin. Dites « Active Express Freeze » et le haut-parleur AI écoute et s'assure que vos courses sont prises en charge.",
      "stock": 20,
      "image_url": "assets/images/moulinex.jpg",
    },
    {
      "category_id": 3,
      "name": "woofer",
      "price": 5000,
      "description": "tres qualité",
      "stock": 20,
      "image_url": "assets/images/woofer.jpg",
    },
    {
      "category_id": 4,
      "name": "fer repasser",
      "price": 20000,
      "description": "tres qualité",
      "stock": 20,
      "image_url": "assets/images/ferrepasser.jpg",
    },
    {
      "category_id": 5,
      "name": "chauffe Eau",
      "price": 3500,
      "description": "tres qualité",
      "stock": 20,
      "image_url": "assets/images/chauffe.jpg",
    },
    {
      "category_id": 6,
      "name": "gazinière",
      "price": 20000,
      "description": "tres qualité",
      "stock": 20,
      "image_url": "assets/images/gaziniere.jpg",
    },
    {
      "category_id": 7,
      "name": "Onde",
      "price": 20000,
      "description": "tres qualité",
      "stock": 20,
      "image_url": "assets/images/onde.jpg",
    },
    {
      "category_id": 8,
      "name": "Chargeur",
      "price": 20000,
      "description": "tres qualité",
      "stock": 20,
      "image_url": "assets/images/chargeur.jpg",
    },
  ];
  int _currentIndex = 0;
  void setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acceuil', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 13),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Rechercher un produit",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.search, color: Colors.grey, size: 22),
                ],
              ),
            ),
            SizedBox(height: 15),

            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                "CATALOGUE",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: produits.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                final product = produits[index];

                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProduitDetailsPage(product: product),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        product["image_url"] != null
                            ? Image.asset(
                                product["image_url"],
                                height: 80,
                                fit: BoxFit.contain,
                              )
                            : Icon(Icons.add_business, size: 60),
                        SizedBox(height: 15),
                        Text(product["name"], style: TextStyle(fontSize: 15)),
                        SizedBox(height: 5),
                        Text(
                          "${product["price"]} FCFA",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setCurrentIndex(index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Acceuil"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: "Panier",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "compte"),
        ],
      ),
    );
  }
}
