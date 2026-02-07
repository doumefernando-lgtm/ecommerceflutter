import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;

  const Input({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return "Veuillez saisir votre $label";
          }
          return null;
        },
      ),
    );
  }
}
