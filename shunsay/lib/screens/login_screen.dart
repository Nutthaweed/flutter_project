// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:windby/components/signin_button.dart';
import 'package:windby/constant/my_constant.dart';
import 'package:windby/components/text_fields.dart';

class LoginPage extends StatefulWidget { 
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

 final passwordController = TextEditingController();

 void signUserIn()  async{

    showDialog(context: context, builder: (context) {
          return const Center(
              child: CircularProgressIndicator()
          );
    },);

try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text, 
      password: passwordController.text
    );

  
  Navigator.pop(context);
} on FirebaseAuthException catch (e) {

  Navigator.pop(context);
  if ( e.code == 'user-not-found') {
     showDialog(context: context, builder: (context) {
      return  const AlertDialog(
          backgroundColor:  Colors.redAccent,
          title: Center(
            child: Text(
              'Incorrect Email',
              style: TextStyle(color: Colors.white)
            )
          ),
      );
    });
  } 
  
  else if ( e.code == 'wrong-password') {
     showDialog(context: context, builder: (context) {
      return  const AlertDialog(
          backgroundColor:  Colors.redAccent,
          title: Center(
            child: Text(
              'Incorrect Password',
              style: TextStyle(color: Colors.white)
            )
          ),
      );
    });
  }
}

}







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConstant.secondary,
      body:  SafeArea(  
        child: Center(
          child: SingleChildScrollView(
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
                  controller:  emailController,
                  hintText:  'Email',
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
          
                Row(
                   mainAxisAlignment:  MainAxisAlignment.center,
                   children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700],)
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Sign Up',
                      style:  TextStyle(color: Colors.blue, fontWeight:  FontWeight.bold,),
          
                    )
                   ]
                ),
          
              ]
            ),
          )
        )
      ),
    );
  }
}