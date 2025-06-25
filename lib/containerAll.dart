import 'package:flutter/material.dart';

class Containerall extends StatelessWidget {
  Widget child;
   Containerall({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.child,
      margin: EdgeInsets.all(15.00),
      padding: EdgeInsets.all(15.00),
      decoration: BoxDecoration(color: Color.fromRGBO(235, 229, 229, 0.5),
      borderRadius: BorderRadius.circular(20) ),
    );
  }
}