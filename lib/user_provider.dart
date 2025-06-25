import 'package:flutter/cupertino.dart';
import 'package:teachehunt/user.dart';

class UserProvider extends InheritedWidget {
  final List<User> users;
  User? userSelected;
  int? indexUser;

  UserProvider({required this.users, required Widget child})
    : super(child: child);

  static UserProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>();
  }

  @override
  bool updateShouldNotify(UserProvider oldWidget) {
    return true; // Ou alguma lógica de comparação entre "users" se quiser
  }
}
