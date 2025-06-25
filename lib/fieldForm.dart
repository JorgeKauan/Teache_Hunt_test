import 'package:flutter/material.dart';

class Fieldform extends StatelessWidget {
  final String label;
  final bool isPassword;
  final TextEditingController controller;
  bool? isForm = true;

  Fieldform({
    required this.label,
    required this.isPassword,
    required this.controller,
    required this.isForm,
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
    );
  }
}
