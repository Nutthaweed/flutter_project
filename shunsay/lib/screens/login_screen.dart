import 'package:flutter/material.dart';
import 'package:windby/constant/my_constant.dart';
import 'package:windby/components/text_fields.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConstant.primary,
      body:  SafeArea(  
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Image(
                image: AssetImage('assets/images/Kmutnb.jpg'),
                height: 100,
                width:  100,
              ),
              const SizedBox(height: 50),
              Text('Welcome back!',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16
              )
              ),
              const SizedBox(height: 25),

              const MyTextField(),

              const SizedBox(height:  25,),

               const MyTextField()
             
            ]
          )
        )
      ),
    );
  }
}