import 'package:flutter/material.dart';
import 'package:shunsay/constant/my_constant.dart';
import 'package:shunsay/components/side_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    drawer: const SideBar(),
    appBar: AppBar(
      backgroundColor:  MyConstant.primary,
      leading:  IconButton(
        icon: const Icon(Icons.menu),
        color: MyConstant.active,
        onPressed:() => {
          const SideBar()
        },
      ),
    title: const Text('Welcome to Shunsay'),
    actions:  [
      Icon(Icons.search, size: 24, color: MyConstant.active,),
      const SizedBox(width: 20,),
      Icon(Icons.verified_user_outlined, size: 24, color: MyConstant.active,),
      const SizedBox(width: 20,),
    ]
    ),
   
  );
  }
}