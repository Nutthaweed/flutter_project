import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class SideBar extends StatelessWidget {
   SideBar({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(accountName:  const Text(''), accountEmail: Text('${user.email}!'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child:  Image.network(
                  'https://media.discordapp.net/attachments/1129443288097759322/1174588647740289075/image.png?ex=656823ec&is=6555aeec&hm=d9a83f0626f4f2cadf93c56f5f8c1df35c4fe433695a34d0cb872f6e8d68e2ba&=&format=webp&width=1361&height=671',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://media.discordapp.net/attachments/1129443288097759322/1174588647740289075/image.png?ex=656823ec&is=6555aeec&hm=d9a83f0626f4f2cadf93c56f5f8c1df35c4fe433695a34d0cb872f6e8d68e2ba&=&format=webp&width=1361&height=671'
                  ),
                  fit: BoxFit.cover,
                )
              )
            ),
             ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Exit'),
              onTap: signUserOut,
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings')
            )
          ]
        )
    );
  }
}