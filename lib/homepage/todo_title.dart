import 'package:flutter/material.dart';

class TodoTitle extends StatelessWidget{
  const TodoTitle({super.key});

  static const String title="유나's Tasks"; //AppBar 타이틀 텍스트 작성

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20, //폰트 사이즈 작성
        fontWeight: FontWeight.bold, //폰트 굵기 설정
      ),
    );
  }
}