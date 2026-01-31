class Cart {
  static final List<Map<String, dynamic>> items = [];

  static void addProduct(Map<String, dynamic> product, int quantite) {
    final index = items.indexWhere(
      (item) => item["product"]["name"] == product["name"],
    );

    if (index >= 0) {
      items[index]["quantite"] += quantite;
    } else {
      items.add({"product": product, "quantite": quantite});
    }
  }

  static double get sousTotal {
    double total = 0;
    for (var item in items) {
      total += (item["product"]["price"] as num) * item["quantite"];
    }
    return total;
  }
}


