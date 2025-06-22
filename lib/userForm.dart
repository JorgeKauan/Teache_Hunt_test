import 'package:flutter/material.dart';
import 'package:teachehunt/fieldForm.dart';
import 'package:teachehunt/user.dart';
import 'package:teachehunt/user_provider.dart';



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

   void save() {
  final userProvider = UserProvider.of(context);

  if (userProvider != null) {
    User user = User(
      name: controllerName.text,
      email: controllerEmail.text,
      password: controllerPassword.text,
    );


    int usersLength = userProvider.users.length;

    userProvider.users.insert(usersLength, user);
  } else {
    print('UserProvider não encontrado no contexto');
  }

  print(userProvider?.users[0].name);


  Navigator.popAndPushNamed(context, "/list");
}


    return Scaffold(
      appBar: AppBar(
        title: Text('Create User'),
      ),
      body: Center(
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
                onPressed: save,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: Text('Salvar',
                style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
