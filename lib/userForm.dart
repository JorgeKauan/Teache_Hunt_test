import 'package:flutter/material.dart';
import 'package:teachehunt/containerAll.dart';
import 'package:teachehunt/fieldForm.dart';
import 'package:teachehunt/user.dart';
import 'package:teachehunt/user_provider.dart';

class Userform extends StatefulWidget {
  const Userform({super.key});

  @override
  State<Userform> createState() => _UserformState();
}

class _UserformState extends State<Userform> {
  String title = "Criando Usuário";

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

      setState(() {
        this.title = 'Editando Usuário';
      });
    }

    GlobalKey<FormState> _key = GlobalKey();

    void save() {

      final isValidate = _key.currentState?.validate();

      if(isValidate == false){
        return;
      } 

      _key.currentState?.save();

      final userProvider = UserProvider.of(context);

      User user = User(
        name: controllerName.text,
        email: controllerEmail.text,
        password: controllerPassword.text,
      );

      if (index != null) {
        userProvider!.users[index] = user;
      } else {
        int userLength = userProvider!.users.length;

        userProvider.users.insert(userLength, user);
      }

      print(userProvider.users[0].name);

      Navigator.popAndPushNamed(context, "/list");
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
          child: Form(
            key: _key,
            child: Column(
              children: [
                Fieldform(
                  label: 'Name',
                  isPassword: false,
                  controller: controllerName,
                  isForm: true,
                  isEmail: false,
                ),
                Fieldform(
                  label: 'Email',
                  isPassword: false,
                  controller: controllerEmail,
                  isForm: true,
                  isEmail: true,
                ),
                Fieldform(
                  label: 'Password',
                  isPassword: true,
                  controller: controllerPassword,
                  isForm: true,
                  isEmail: false,
                ),
                    
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    margin: EdgeInsets.all(16.00),
                    child: ElevatedButton(
                      onPressed: save,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      child: Text('Salvar', style: TextStyle(color: Colors.white)),
                    ),
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
