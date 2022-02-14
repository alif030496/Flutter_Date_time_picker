// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DateTime? date;
  TimeOfDay? time;

  getDate() async {
    DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 20),
        lastDate: DateTime(DateTime.now().year + 20));
    setState(() {
      date = newDate;
    });
  }

  getTime() async {
    TimeOfDay? newtime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    setState(() {
      time = newtime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Date & Time Picker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(date == null
                ? "Choose Date"
                : "Date: ${date?.day}/${date?.month}/${date?.year}"),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                getDate();
              },
              child: Text("Date Picker"),
              color: Colors.blue,
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              onPressed: () {
                getTime();
              },
              child: Text("Time Picker"),
              color: Colors.deepOrange,
            ),
            SizedBox(
              height: 20,
            ),
            Text(time == null
                ? "Choose Time"
                : "Time: ${time?.hour}:${time?.minute}"),
          ],
        ),
      ),
    ));
  }
}
