import 'package:flutter/material.dart';

import 'login_Screen.dart';
import 'notifications.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Center(child: Text("Dashboard")),
          backgroundColor: const Color(0xff5ac18e),
            actions: [
            ElevatedButton.icon(onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationScreen()),
                  );}, icon: Icon(Icons.notifications_outlined), label: Text(""),
            style: ElevatedButton.styleFrom(
              backgroundColor:  const Color(0xff5ac18e),
               shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),

                  ),
                  shadowColor: Colors.white,
            ),),
          ],
        ),
        body: const Center(
          child: Text("Dashboard Screen"),
        ));
  }
}
