import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];
  List<Map<String, dynamic>> get items => _items;

  void addProduct(Map<String, dynamic> product, int quantite) {
    final index = _items.indexWhere(
      (e) => e["product"]["name"] == product["name"], // plus sûr que id
    );
    if (index >= 0) {
      _items[index]["quantite"] += quantite;
    } else {
      _items.add({"product": product, "quantite": quantite > 0 ? quantite : 1});
    }
    notifyListeners();
  }

  void increment(int index) {
    _items[index]["quantite"]++;
    notifyListeners();
  }

  void decrement(int index) {
    if (_items[index]["quantite"] > 1) {
      _items[index]["quantite"]--;
    }
    notifyListeners();
  }

  double get total {
    double total = 0;
    for (var item in _items) {
      total += (item["product"]["price"] as num) * item["quantite"];
    }
    return total;
  }

  bool get isEmpty => _items.isEmpty;
}
