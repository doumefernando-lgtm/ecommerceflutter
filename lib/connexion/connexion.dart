import 'package:appecommerce/connexion/signUp.dart';
import 'package:appecommerce/pages/home.dart';
import 'package:appecommerce/services/firebase/auth.dart';
import 'package:appecommerce/widget/input.dart';
import 'package:appecommerce/widget/squarre.dart';

import 'package:flutter/material.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  final _fromKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final authService = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 30),
            margin: EdgeInsets.all(30),
            child: Column(
              children: [
                Text(
                  "connexion",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text("Bienvenue à nouveau dans votre application"),

                SizedBox(height: 25),
                Form(
                  key: _fromKey,
                  child: Column(
                    children: [
                      Input(
                        controller: _emailController,
                        label: "Mail",
                        hint: "veiullez saisir votre addresse",
                      ),
                      Input(
                        controller: _passwordController,
                        label: "Mot de pass",
                        hint: "votre mot de pass",
                      ),

                      SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_fromKey.currentState!.validate()) {
                              try {
                                await authService.loginWithEmailAndPassword(
                                  _emailController.text.trim(),
                                  _passwordController.text.trim(),
                                );

                                // Navigation vers Home après connexion réussie
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (_) => Home()),
                                );
                              } catch (e) {
                                // Affiche une erreur si email/mot de passe incorrect
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Mot de pass ou email non valide",
                                    ),
                                  ),
                                );
                              }
                            }
                          },
                          child: Text("Se connecter"),
                        ),
                      ),

                      SizedBox(height: 15),

                      Row(
                        children: [
                          Expanded(child: Divider(thickness: 0.5)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text("ou continuer avec"),
                          ),
                          Expanded(child: Divider(thickness: 0.5)),
                        ],
                      ),
                      SizedBox(height: 5),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Square(path: "assets/images/google.png"),
                          SizedBox(width: 10),
                          Square(path: "assets/images/apple.png"),
                        ],
                      ),
                      SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Pas de compte ? "),
                          GestureDetector(
                            onTap: () {},
                            child: TextButton(
                              child: Text(
                                "Inscrivez-vous",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Signup();
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
