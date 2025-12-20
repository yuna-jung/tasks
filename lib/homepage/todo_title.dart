import 'package:flutter/material.dart';

class TodoTitle extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Text(
      "유나's Tasks",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
