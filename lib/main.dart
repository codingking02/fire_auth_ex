// ignore_for_file: unused_import

import 'package:fire_auth_ex/view/chat_collection/allchat.dart';
import 'package:fire_auth_ex/view/chat_collection/chat_screen.dart';
import 'package:fire_auth_ex/view/home.dart';
import 'package:fire_auth_ex/view/login.dart';
import 'package:fire_auth_ex/view/products/addproducts.dart';
import 'package:fire_auth_ex/view/products/productslist.dart';
import 'package:fire_auth_ex/view/realtime_database/database_view.dart';
import 'package:fire_auth_ex/view/register.dart';
import 'package:fire_auth_ex/view/userprofile.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseDatabase.instance.setPersistenceEnabled(true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Register(),
    );
  }
}
