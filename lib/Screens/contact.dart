import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'login_Screen.dart';
import 'notifications.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Center(child: Text("Contacts")),
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
          child: Text("Contact Screen"),
        ));
  }
}