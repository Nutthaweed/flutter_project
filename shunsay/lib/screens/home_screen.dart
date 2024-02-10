import 'package:flutter/material.dart';
import 'package:windby/constant/my_constant.dart';
import 'package:windby/components/side_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    drawer: SideBar(),
    appBar: AppBar(
      backgroundColor:  MyConstant.primary,
      leading:  Builder(builder: (context) {
        return IconButton(
        icon: const Icon(Icons.menu),
        color: MyConstant.active,
        onPressed:() => {
          Scaffold.of(context).openDrawer()
        },
        );
      }
      ),
    title: const Text('Welcome to Windy',textAlign: TextAlign.center),

    ),
   
  );
  }
}