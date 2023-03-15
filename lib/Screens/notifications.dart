import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'login_Screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
      return Container(
        color: Colors.transparent,
        // height: MediaQuery.of(context).size.height * 0.10,
        // width: double.infinity,
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height - MediaQuery.of(context).size.height * 0.50),
        child: Scaffold(
        backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Center(child: Text("Notifications")),
            backgroundColor: const Color(0xff5ac18e),
            //   actions: [
            //   ElevatedButton.icon(onPressed: () {MaterialPageRoute(builder: (context) => LoginScreen());}, icon: Icon(Icons.notifications_outlined), label: Text(""),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor:  const Color(0xff5ac18e),
            //      shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(8.0),
      
            //         ),
            //         shadowColor: Colors.white,
            //   ),),
            // ],
          ),
          body: const Center(
            child: Text("Notification Screen"),
          )),
      );
  }
}