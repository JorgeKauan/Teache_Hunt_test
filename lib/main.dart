import 'package:flutter/material.dart';
import 'package:teachehunt/userForm.dart';
import 'package:teachehunt/user_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      users: [],
      child: MaterialApp(
        title: 'App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: Scaffold(
          appBar: AppBar(title: Text('App')),
          body: Userform(),
        ),
        routes: {},
      ),
    );
  }
}
