import 'package:flutter/material.dart';
import 'package:to_do_app/homepage/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Nanum_Gothic', //앱 전체에 사용할 기본 폰트 설정
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey[400],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, //라이트 모드 AppBar 배경색
          foregroundColor: Colors.black, //AppBar안의 텍스트/아이콘 색상
        ),
        colorScheme: ColorScheme.fromSeed( 
          seedColor: Colors.lightGreen, //앱의 기본 컬러 설정
          brightness: Brightness.light, //라이트 모드 색상 스킴 사용
        ),
      ),
      darkTheme: ThemeData( //다크 모드 시 적용될 테마
        useMaterial3: true,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
        foregroundColor: Colors.white, //다크 모드 AppBar 텍스트 컬러 화이트로 지정
        ),

          colorScheme: ColorScheme.dark(
          brightness: Brightness.dark,
          ),
      ),
      themeMode: ThemeMode.light,
      home: const Homepage(),
    );
  }
}