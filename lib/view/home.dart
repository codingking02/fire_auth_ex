import 'package:fire_auth_ex/view/login.dart';
import 'package:fire_auth_ex/view/userprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            Container(
              color: Colors.blue,
              child: DrawerHeader(
                child: ListTile(
                  title: Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                  builder: (context) {
                    return Home();
                  },
                ), (route) => false);
              },
              leading: Icon(Icons.home),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return UserProfile();
                    },
                  ),
                );
              },
              leading: Icon(Icons.person),
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              onTap: () async {
                await FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return login();
                    },
                  ), (route) => false);
                });
              },
              leading: Icon(Icons.logout),
              title: Text(
                "Log Out",
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
