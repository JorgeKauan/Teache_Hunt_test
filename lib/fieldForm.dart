import 'package:flutter/material.dart';

class Fieldform extends StatelessWidget {
  final String label;
  final bool isPassword;
  final TextEditingController controller;
  bool? isForm = true;
  bool isEmail = false;

  Fieldform({
    required this.label,
    required this.isPassword,
    required this.controller,
    this.isForm,
    required this.isEmail,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: this.isForm,
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
      ),
      validator: (value) {
        if (value!.length < 5) {
          return 'Digite no minimo 5 caracteres';
        }
        if (this.isEmail && !value.contains("@")) {
          return 'Digite o email corretamente';
        }
      },
    );
  }
}
