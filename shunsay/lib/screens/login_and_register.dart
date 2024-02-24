import 'package:flutter/material.dart';
import 'package:windby/screens/login_screen.dart';
import 'package:windby/screens/register_screen.dart';

class LoginandRegisterPage extends StatefulWidget {
  const LoginandRegisterPage ({super.key});

  @override
  State<LoginandRegisterPage> createState() =>LoginandRegisterPageState();
}

class LoginandRegisterPageState extends State<LoginandRegisterPage > {

  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: togglePages,
      );
    }

    else {
      return RegisterScreen(
        onTap: togglePages,
      );
    }
  }
}