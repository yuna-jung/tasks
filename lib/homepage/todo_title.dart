import 'package:flutter/material.dart';

class TodoTitle extends StatelessWidget{
  const TodoTitle({super.key});

  static const String title="유나's Tasks";

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}