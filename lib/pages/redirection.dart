import 'package:appecommerce/connexion/connexion.dart';
import 'package:appecommerce/pages/home.dart';
import 'package:appecommerce/services/firebase/auth.dart';
import 'package:flutter/material.dart';


class Redirection extends StatefulWidget {
  const Redirection({super.key});

  @override
  State<Redirection> createState() => _RedirectionState();
}

class _RedirectionState extends State<Redirection> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasData) {
          return Home();
        } else {
          return Connexion();
        }
      },
    );
  }
}
