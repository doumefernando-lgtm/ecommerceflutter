import 'package:appecommerce/connexion/connexion.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ComptePage extends StatelessWidget {
  const ComptePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mon Compte")),
      body: Center(
        child: StreamBuilder<User?>(
          // Écoute les changements de connexion
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // Vérifie si la connexion avec Firebase est en cours
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            // Récupère l'utilisateur actuel
            final user = snapshot.data;

            if (user == null) {
              // Si aucun utilisateur connecté → rediriger vers login
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Aucun utilisateur connecté",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: const Text("Se connecter"),
                  ),
                ],
              );
            }

            // Si l'utilisateur est connecté
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Email connecté :", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text(
                  user.email ?? "Email non disponible",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    // Redirection vers login après déconnexion
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const Connexion(),
                      ), // ta page login
                    );
                  },
                  child: const Text("Se déconnecter"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
