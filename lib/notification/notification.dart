import 'package:fire_auth_ex/notification/notification_badges.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Notify extends StatefulWidget {
  const Notify({super.key});

  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  int _totalNotification = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("notify"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "App Firebase push Notification",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            NotificationBadges(
              totalNotification: _totalNotification,
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  registernotification() {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  }
}
