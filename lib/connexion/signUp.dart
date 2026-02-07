
import 'package:appecommerce/connexion/connexion.dart';
import 'package:appecommerce/services/firebase/auth.dart';
import 'package:appecommerce/widget/input.dart';
import 'package:appecommerce/widget/squarre.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
                  "Inscription",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text("Bienvenue sur votre application"),

                SizedBox(height: 25),
                Form(
                  key: _fromKey,
                  child: Column(
                    children: [
                      Input(controller: _emailController,
                        label: "Mail",
                        hint: "veiullez saisir votre addresse",
                      ),
                      Input(controller: _passwordController,
                        label: "Mot de pass",
                        hint: "veiullez saisir vun mot de pass",
                      ),

                      SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Connexion();
                                },
                              ),
                            );
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
                                "Connectez-vous",
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
                                      return Connexion();
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
