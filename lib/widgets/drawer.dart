import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  final image = ('assets/images/adhil.jpeg.jpg');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SingleChildScrollView(),
                DrawerHeader(
                     padding: EdgeInsets.zero,
                    child: UserAccountsDrawerHeader(
                      margin: EdgeInsets.zero,
                      accountName: const Text('Adhil N'),
                      accountEmail: const Text('anonadhil@gmail.com'),
                      decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                      ),
                       currentAccountPicture: CircleAvatar(
                         radius: 60.0,
                         backgroundImage: AssetImage(image),
                    ), //For Image Asset
                  ),
                    ),
            const ListTile(
              leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
              ),
              title: Text('Home',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text('Profile',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text('Email Me',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
              ],
            ),
      ),
    );
  }
}
