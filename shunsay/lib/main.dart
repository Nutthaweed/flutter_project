
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'constant/my_constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: MyConstant.primary,
          primaryColor: MyConstant.primary),
      home: const HomeScreen(),
    );
  }
}