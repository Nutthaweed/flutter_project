// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:windby/components/signin_button.dart';
import 'package:windby/constant/my_constant.dart';
import 'package:windby/components/text_fields.dart';

class RegisterScreen extends StatefulWidget { 
  final Function() ? onTap;
  const RegisterScreen({super.key, required this.onTap});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
 final passwordController = TextEditingController();
 final confirmpasswordController = TextEditingController();

 void signUserUp()  async{

    showDialog(context: context, builder: (context) {
          return const Center(
              child: CircularProgressIndicator()
          );
    },);

try {
  if (passwordController.text == confirmpasswordController.text){
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text, 
      password: passwordController.text
    );
  } else {
    showErrormessage("Passwords don't match each other, please try again");
  }

  
  Navigator.pop(context);
} on FirebaseAuthException catch (e) {

  Navigator.pop(context);
  showErrormessage(e.code);
}

}

void showErrormessage(String message) {
  showDialog(context: context, builder: (context) {
      return   AlertDialog(
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
                Text('Get Ready for Our App, Just register!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16
                )
                ),
                const SizedBox(height: 20),
          
                 MyTextField(
                  controller:  emailController,
                  hintText:  'Email',
                  obscureText:  false,
                ),
          
                const SizedBox(height:  10,),
          
                  MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText:  true,
                 ),

                 const SizedBox(height:  10,),
          
                  MyTextField(
                  controller: confirmpasswordController,
                  hintText: 'Confirm Password',
                  obscureText:  true,
                 ),
               
                const SizedBox(height: 10,),
          
                
          
                  const SizedBox(height: 25),
          
                   MyButton(
                    text: 'Sign Up',
                    onTap: signUserUp,
                   ),
          
                  const SizedBox(height:  20,),
          
                Row(
                   mainAxisAlignment:  MainAxisAlignment.center,
                   children: [
                    Text(
                      'Already member?',
                      style: TextStyle(color: Colors.grey[700],)
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Sign In',
                        style:  TextStyle(color: Colors.blue, fontWeight:  FontWeight.bold,),
                              
                      ),
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