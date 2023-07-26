import 'package:fire_auth_ex/view/realtime_database/model/user_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RealTimeDataBase extends StatelessWidget {
  const RealTimeDataBase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter RealTime_DataBase",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                createData();
              },
              child: Text('create data'),
            ),
          ],
        ),
      ),
    );
  }

  void createData() {
    FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
    UserModel userModel = UserModel(
        email: "ali@gmail.com",
        jobTitle: "student",
        name: "ali",
        phone: "010....");
    firebaseDatabase.ref().child("Flutter_team").set(
          userModel.tomMap(),
        );
  }
}
