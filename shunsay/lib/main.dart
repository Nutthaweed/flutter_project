
import 'package:flutter/material.dart';
import 'package:windby/screens/auth_screen.dart';

import 'constant/my_constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          fontFamily: 'customFont',
          brightness: Brightness.light,
          scaffoldBackgroundColor: MyConstant.secondary,
          primaryColor: MyConstant.primary),
      home: const AuthPage(),
    );
  }
}