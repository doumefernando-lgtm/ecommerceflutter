import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String label;
  final String hint;

  const Input({super.key, required this.label, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: TextFormField(
        style: TextStyle(fontSize: 10),
        decoration: InputDecoration(
          label: Text(label),
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),

        validator: (value) {
          if (value == null || value.isEmpty) {
            return "veuillez saisir votre" + label;
          }
          return null;
        },
      ),
    );
  }
}
