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
        fontFamily: 'Nanum_Gothic',
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey[400],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightGreen,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        ),

        useMaterial3: true,
        colorScheme: const ColorScheme.dark().copyWith(
          onSurface: Colors.black,
          ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black)
        )
      ),
      themeMode: ThemeMode.dark,
      home: const Homepage(),
    );
  }
}