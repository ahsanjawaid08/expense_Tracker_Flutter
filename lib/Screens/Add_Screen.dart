// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/Screens/Home_Screen.dart';
import 'package:todoapp/Screens/login_Screen.dart';
import 'package:todoapp/widgets/NumberButton.dart';

import 'notifications.dart';
// import 'package:todoapp/globalVar.dart' as g;

class Add_Screen extends StatefulWidget {
  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  static const menuItems = <String>[
    'Expense',
    'Income',
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  String _btn1SelectedVal = 'Expense';
  final double buttonSize = 40;
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController timeInput = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  TextEditingController titleInput = TextEditingController();
  TextEditingController descriptionInput = TextEditingController();
  TextEditingController amountInput = TextEditingController();
  int cursorOffset = 0;

  // @override
  // void initState() {
  //   amountInput.addListener(() {
  //     cursorOffset = amountInput.selection.baseOffset;
  //     print(cursorOffset);
  //   });

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
         title: Center(child: Text("Dashboard")),
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
          // title: Center(
          //     child: Row(
          //   children: [
          //     Text("Expense Tracker"),
          //     Container(
          //       child: ElevatedButton(
          //         onPressed: () {
          //           MaterialPageRoute(builder: (context) => LoginScreen());
          //         },
          //         child: ElevatedButton.icon(
          //           style: ElevatedButton.styleFrom(
          //             backgroundColor: const Color(0xff5ac18e),
          //           ),
          //           onPressed: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) => Add_Screen()));
          //           },
          //           icon: const Icon(
          //             Icons.logout_outlined,
          //             size: 15.0,
          //           ),
          //           label: const Text('Logout', style: TextStyle(fontSize: 12.0),), // <-- Text
          //         ),
          //       ),
          //     )
          //   ],
          // )),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(top: 9.0),
            child: Column(
              children: [
                TextField(
                  controller: titleInput,
                  keyboardType: TextInputType.text,
                  maxLength: 30,
                  decoration: InputDecoration(
                    hintText: "Title",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(
                            width: 1, color: const Color(0xff5ac18e))),
                    counterText: '',
                  ),
                ),
                SizedBox(height: 13.0),
                TextField(
                  controller: descriptionInput,
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  maxLength: 100,
                  decoration: InputDecoration(
                    hintText: "Description",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(
                            width: 1, color: const Color(0xff5ac18e))),
                    counterText: '',
                  ),
                ),
                SizedBox(height: 13.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        selectDate(context);
                      },
                      icon: Icon(Icons.calendar_month),
                    ),
                    Expanded(
                      child: TextField(
                        controller: dateInput,
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: "Date",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(
                                  width: 1, color: const Color(0xff5ac18e))),
                          counterText: '',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 13.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        selectTime(context);
                      },
                      icon: Icon(Icons.timer),
                    ),
                    Expanded(
                      child: TextField(
                        controller: timeInput,
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: "Time",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(
                                  width: 1, color: const Color(0xff5ac18e))),
                          counterText: '',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 13.0),
                DecoratedBox(
                  decoration: BoxDecoration(
                    // gradient: LinearGradient(colors: [
                    //   Colors.redAccent,
                    //   Colors.blueAccent,
                    //   Colors.purpleAccent
                    //   //add more colors
                    // ]),
                    color: const Color(0xff5ac18e),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: DropdownButton(
                      hint: Text(''),
                      value: _btn1SelectedVal,
                      items: _dropDownMenuItems,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() => _btn1SelectedVal = newValue);
                        }
                      },
                      isExpanded:
                          true, //make true to take width of parent widget
                      underline: Container(), // empty line
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      dropdownColor: const Color(0xff5ac18e),
                      iconEnabledColor: Colors.white, //Icon color
                    ),
                  ),
                ),
                SizedBox(height: 13.0),
                TextField(
                  controller: amountInput,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Amount",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide:
                            BorderSide(width: 1, color: Colors.blueAccent)),
                    counterText: '',
                  ),
                ),
                // SizedBox(height: 13.0),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     NumberButton(
                //       number: 1,
                //       size: buttonSize,
                //       color: Colors.white,
                //       controller: amountInput,
                //     ),
                //     SizedBox(width: 10.0),
                //     NumberButton(
                //       number: 2,
                //       size: buttonSize,
                //       color: Colors.white,
                //       controller: amountInput,
                //     ),
                //     SizedBox(width: 10.0),
                //     NumberButton(
                //       number: 3,
                //       size: buttonSize,
                //       color: Colors.white,
                //       controller: amountInput,
                //     ),
                //   ],
                // ),
                // SizedBox(height: 13.0),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     NumberButton(
                //       number: 4,
                //       size: buttonSize,
                //       color: Colors.white,
                //       controller: amountInput,
                //     ),
                //     SizedBox(width: 10.0),
                //     NumberButton(
                //       number: 5,
                //       size: buttonSize,
                //       color: Colors.white,
                //       controller: amountInput,
                //     ),
                //     SizedBox(width: 10.0),
                //     NumberButton(
                //       number: 6,
                //       size: buttonSize,
                //       color: Colors.white,
                //       controller: amountInput,
                //     ),
                //   ],
                // ),
                // SizedBox(height: 13.0),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     NumberButton(
                //       number: 7,
                //       size: buttonSize,
                //       color: Colors.white,
                //       controller: amountInput,
                //     ),
                //     SizedBox(width: 10.0),
                //     NumberButton(
                //       number: 8,
                //       size: buttonSize,
                //       color: Colors.white,
                //       controller: amountInput,
                //     ),
                //     SizedBox(width: 10.0),
                //     NumberButton(
                //       number: 9,
                //       size: buttonSize,
                //       color: Colors.white,
                //       controller: amountInput,
                //     ),
                //   ],
                // ),
                // SizedBox(height: 13.0),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     NumberButton(
                //       number: 0,
                //       size: buttonSize,
                //       color: Colors.white,
                //       controller: amountInput,
                //     ),
                //     SizedBox(width: 10.0),
                //     TextButton(
                //       onPressed: () {
                //         try {
                //           amountInput.text = amountInput.text
                //               .substring(0, amountInput.text.length - 1);
                //         } on RangeError catch (e) {
                //           print(e);
                //         }
                //       },
                //       child:
                //           Text('Delete', style: TextStyle(color: Colors.white)),
                //       style: ButtonStyle(
                //           shape: MaterialStateProperty.all(
                //               RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.circular(5.0))),
                //           elevation: MaterialStateProperty.all(10.0),
                //           backgroundColor:
                //               MaterialStateProperty.all(Colors.redAccent)),
                //     )
                //   ],
                // ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: addEntry,
          child: const Icon(Icons.check),
          backgroundColor: const Color(0xff5ac18e),
        ),
      ),
    );
  }

  void selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null) {
      setState(() {
        selectedTime = timeOfDay;
        if (selectedTime.hour > 12) {
          if (selectedTime.minute < 10) {
            timeInput.text =
                "${selectedTime.hour % 12}:0${selectedTime.minute} PM";
          } else {
            timeInput.text =
                "${selectedTime.hour % 12}:${selectedTime.minute} PM";
          }
        } else {
          if (selectedTime.minute < 10) {
            timeInput.text = "${selectedTime.hour}:0${selectedTime.minute} AM";
          } else {
            timeInput.text = "${selectedTime.hour}:${selectedTime.minute} AM";
          }
        }
      });
    }
  }

  void selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2025));

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd MMMM, yyyy').format(pickedDate);
      print(formattedDate);

      setState(() {
        dateInput.text = formattedDate; //set output date to TextField value.
      });
    } else {
      print("Date is not selected");
    }
  }

  void addEntry() {
    if (timeInput.text.isEmpty ||
        descriptionInput.text.isEmpty ||
        dateInput.text.isEmpty ||
        timeInput.text.isEmpty ||
        amountInput.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please Enter all the Details!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
        fontSize: 15.0,
      );
    } else {
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => HomeScreen(
      //             title: titleInput.text,
      //             description: descriptionInput.text,
      //             date: dateInput.text,
      //             time: timeInput.text,
      //             amount: amountInput.text,
      //             expense: _btn1SelectedVal)));

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                  title: titleInput.text,
                  description: descriptionInput.text,
                  date: dateInput.text,
                  time: timeInput.text,
                  amount: amountInput.text,
                  expense: _btn1SelectedVal)),
          (route) => false);
    }
  }
}
