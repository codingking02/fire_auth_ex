import 'package:flutter/material.dart';

class NotificationBadges extends StatelessWidget {
  final int totalNotification;
  const NotificationBadges({super.key, required this.totalNotification});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(
            8,
          ),
          child: Text(
            '$totalNotification',
            style: TextStyle(
              color: Colors.red,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
