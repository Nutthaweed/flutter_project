import 'package:flutter/material.dart';
import 'package:windby/components/signin_button.dart';
import 'package:windby/constant/my_constant.dart';
import 'package:windby/components/text_fields.dart';

class LoginPage extends StatelessWidget { 
  LoginPage({super.key});

  final usernameController = TextEditingController();
 final passwordController = TextEditingController();

 void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConstant.secondary,
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

               MyTextField(
                controller:  usernameController,
                hintText:  'Username',
                obscureText:  false,
              ),

              const SizedBox(height:  25,),

                MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText:  true,
               ),
             
              const SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600])
                    )
            ]
                )
                ),

                const SizedBox(height: 25),

                 MyButton(
                  onTap: signUserIn,
                 ),

                const SizedBox(height:  20,),

              

            ]
          )
        )
      ),
    );
  }
}