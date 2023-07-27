import 'package:fire_auth_ex/view/realtime_database/model/user_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RealTimeDataBase extends StatelessWidget {
  DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

  RealTimeDataBase({super.key});

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
              child: const Text('create data'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                await readData();
              },
              child: const Text('read data'),
            ),
          ],
        ),
      ),
    );
  }

  void createData() {
    FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
    UserModel userModel1 = UserModel(
        email: "ali@gmail.com",
        jobTitle: "student",
        name: "ali",
        phone: "010....");
    firebaseDatabase.ref().child("Flutter_team1").set(
          userModel1.tomMap(),
        );
    UserModel userModel2 = UserModel(
        email: "zeyad@gmail.com",
        jobTitle: "student",
        name: "zeyad",
        phone: "010....");
    firebaseDatabase.ref().child("Flutter_team2").set(
          userModel2.tomMap(),
        );
  }

  Future<void> readData() async {
    databaseReference
        .once()
        .then(
          (value) => print(
            "my data is : ${value.snapshot.value}",
          ),
        )
        .then(
          (value) => print(
            "data read  ",
          ),
        );
  }

  Future<void> updatedata() async {}
}
