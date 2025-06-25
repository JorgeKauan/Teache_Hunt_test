import 'package:flutter/material.dart';
import 'package:teachehunt/userForm.dart';
import 'package:teachehunt/userList.dart';
import 'package:teachehunt/userView.dart';
import 'package:teachehunt/user_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      users: [],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: Userform(), 
        routes: {
          "/create": (_) => Userform(),
          "/list": (_) => Userlist(),
          "/view": (_) => Userview(),
        },
      ),
    );
  }
}
