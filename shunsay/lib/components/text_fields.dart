// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
 
  const MyTextField({super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder:  OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.white)
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.grey),
          ),
          fillColor: Colors.grey,
          filled: true,
        )
      )
    );
  }
}

