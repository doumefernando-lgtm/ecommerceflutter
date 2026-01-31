import 'package:appecommerce/pages/home.dart';
import 'package:appecommerce/widget/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => CartProvider(),
  child:AppEcommerce() ,
  ));
}

class AppEcommerce extends StatefulWidget {
  const AppEcommerce({super.key});

  @override
  State<AppEcommerce> createState() => _AppEcommerceState();
}

class _AppEcommerceState extends State<AppEcommerce> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App ecommerce",
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.orange)),
      home: Home(),
    );
  }
}
