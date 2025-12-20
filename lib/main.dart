import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); //앱 실행
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Nanum_Gothic', //전체 앱에 지정 폰트 선언
        useMaterial3: true, 

        scaffoldBackgroundColor: Colors.grey[400], //백그라운드 그레이 컬러 지정

        appBarTheme: const AppBarTheme( 
          backgroundColor: Colors.white, //appbar 컬러 지정
          foregroundColor: Colors.black, //앱바 전체의 앞쪽 요소인 글자색 컬러 지정
        ),

        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue,
          brightness: Brightness.light,
          ),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.lightBlue,
            brightness: Brightness.dark,
          ),
        ),
        themeMode: ThemeMode.light,
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("유나's Tasks", 
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w800)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
         
        ),
      ),
    );
  }
}
