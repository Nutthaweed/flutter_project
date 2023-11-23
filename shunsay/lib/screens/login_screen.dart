import 'package:flutter/material.dart';
import 'package:windby/constant/my_constant.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConstant.primary,
      body:  const SafeArea(  
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),

              
            ]
          )
        )
      ),
    );
  }
}