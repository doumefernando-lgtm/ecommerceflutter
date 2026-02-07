import 'package:appecommerce/firebase_options.dart';
import 'package:appecommerce/pages/splash.dart';
import 'package:appecommerce/widget/cart_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: AppEcommerce(),
    ),
  );
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
      home: SplashScreen(),
    );
  }
}
