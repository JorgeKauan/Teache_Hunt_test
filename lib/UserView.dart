import 'package:flutter/material.dart';
import 'package:teachehunt/containerAll.dart';
import 'package:teachehunt/fieldForm.dart';
import 'package:teachehunt/user.dart';
import 'package:teachehunt/user_provider.dart';

class Userview extends StatefulWidget {
  Userview({super.key});

  @override
  State<Userview> createState() => _UserviewState();
}

class _UserviewState extends State<Userview> {
  String title = "Mostrar Usuário";

  TextEditingController controllerName = TextEditingController();

  TextEditingController controllerEmail = TextEditingController();

  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = UserProvider.of(context) as UserProvider;

    int? index;

    if (userProvider.indexUser != null) {
      index = userProvider.indexUser;
      controllerName.text = userProvider.userSelected!.name;
      controllerEmail.text = userProvider.userSelected!.email;
      controllerPassword.text = userProvider.userSelected!.password;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        backgroundColor: Colors.blue,
        actions: [
          Container(
            child: ElevatedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, "/list");
              },
              child: Text('Lista de Usuários'),
            ),
          ),
        ],
      ),
      body: Containerall(
        child: Center(
          child: Column(
            children: [
              Fieldform(
                label: 'Name',
                isPassword: false,
                controller: controllerName,
                isForm: false,
                isEmail: false,
              ),
              Fieldform(
                label: 'Email',
                isPassword: false,
                controller: controllerEmail,
                isForm: false,
                isEmail: true,
              ),
              Fieldform(
                label: 'Password',
                isPassword: false,
                controller: controllerPassword,
                isForm: false,
                isEmail: false,
              ),
        
              SizedBox(
                width: double.infinity,
                child: Container(
                  margin: EdgeInsets.all(16.00),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, "/create");
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: Text('Editar', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
        
              SizedBox(
                width: double.infinity,
                child: Container(
                  margin: EdgeInsets.all(16.00),
                  child: ElevatedButton(
                    onPressed: () {
                      userProvider.indexUser = null;
                      userProvider.users.removeAt(index!);
                      Navigator.popAndPushNamed(context, "/create");
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: Text('Deletar', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
