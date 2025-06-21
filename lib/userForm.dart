import 'package:flutter/material.dart';
import 'package:teachehunt/fieldForm.dart';

class Userform extends StatefulWidget {
  const Userform({super.key});

  @override
  State<Userform> createState() => _UserformState();
}

class _UserformState extends State<Userform> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Fieldform(
            label: 'Name',
            isPassword: false,
            controller: controllerName,
          ),
          Fieldform(
            label: 'Email',
            isPassword: false,
            controller: controllerEmail,
          ),
          Fieldform(
            label: 'Password',
            isPassword: true,
            controller: controllerPassword,
          ),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: Text('Salvar'),
            ),
          ),
        ],
      ),
    );
  }
}
