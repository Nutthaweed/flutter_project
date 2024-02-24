// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:windby/components/signin_button.dart';
import 'package:windby/components/square.dart';
import 'package:windby/constant/my_constant.dart';
import 'package:windby/components/text_fields.dart';
import 'package:windby/services/aurh_service.dart';

class LoginPage extends StatefulWidget { 
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

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
  showErrormessage(e.code);
}

}

void showErrormessage(String message) {
  showDialog(context: context, builder: (context) {
      return AlertDialog(
          backgroundColor:  Colors.redAccent,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white)
            )
          ),
      );
    });
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
                  height: 75,
                  width:  75,
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
                    text: 'Sign in',
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
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Sign Up',
                        style:  TextStyle(color: Colors.blue, fontWeight:  FontWeight.bold,),
                              
                      ),
                    )
                   ]
                ),

                 const SizedBox(height:  50,),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal:  10.0),
                    child:  Text(
                      "You can sign in with"
                    )
                    ,),

                    const SizedBox(height: 20),

                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          SquareTile(
                            onTap: () =>  AuthService().signInWithGoogle(),
                            imagePath: 'assets/images/google.png'),

                          const SizedBox(width:  10,),

                          SquareTile(
                            onTap: () {},
                            imagePath: 'assets/images/ICIT.png')
                      ],
                    ),

              ]
            ),
          )
        )
      ),
    );
  }
}