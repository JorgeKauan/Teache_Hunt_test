import 'package:flutter/material.dart';
import 'package:teachehunt/containerAll.dart';
import 'package:teachehunt/user.dart';
import 'package:teachehunt/user_provider.dart';

class Userlist extends StatelessWidget {
  const Userlist({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = UserProvider.of(context) as UserProvider;

    List<User> users = userProvider.users;

    int usersLength = users.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
        backgroundColor: Colors.blue,
        leading: BackButton(
          onPressed: () {
            userProvider.indexUser = null;
            Navigator.popAndPushNamed(context, "/create");
          },
        ),
      ),
      body: Containerall(
        child: ListView.builder(
          itemCount: usersLength,
          itemBuilder: (BuildContext contextBuilder, indexBuilder) => Container(
            child: ListTile(
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      userProvider.userSelected = users[indexBuilder];
                      userProvider.indexUser = indexBuilder;
                      Navigator.popAndPushNamed(context, "/create");
                    },
                    icon: Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      userProvider.userSelected = users[indexBuilder];
                      userProvider.indexUser = indexBuilder;
                      Navigator.popAndPushNamed(context, "/view");
                    },
                    icon: Icon(Icons.visibility, color: Colors.blue,),
                  ),
                  IconButton(
                    onPressed: () {
                      userProvider.indexUser = null;
                      userProvider.users.removeAt(indexBuilder);
                      Navigator.popAndPushNamed(context, "/create");
                    },
                    icon: Icon(Icons.delete, color: Colors.red,
                  ),
                )
              ]
              ),
              title: Text(users[indexBuilder].name),
            ),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.8)),
            ),
          ),
        ),
      ),
    );
  }
}
