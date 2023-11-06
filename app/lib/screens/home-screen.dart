import 'dart:async';
import 'dart:math';

import 'package:app/ui/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Setting application variables
  int time = 25;
  int break_time = 5;
  Timer? timer;
  int counter = 25 * 60; // converting into seconds

  /*Setting up the timer*/
  void _startTimer(int timeInMinutes) {
    counter = timeInMinutes * 60;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (counter == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          counter--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColor.secondColor,
        centerTitle: true,
        title: Text("Study Bish!"),
      ),

      /*Working wiht the body*/
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${counter ~/ 60 < 10 ? "0" + (counter ~/ 60).toString() : counter ~/ 60}:${counter % 60 < 10 ? "0" + (counter % 60).toString() : counter % 60}",
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: max(140, MediaQuery.of(context).size.width / 8),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RawMaterialButton(
                onPressed: () {
                  setState(() {
                    if (timer != null) {
                      timer!.cancel();
                    }
                  });
                  _startTimer(25);
                },
                fillColor: AppColor.secondColor,
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 64.0),
                child: Text(
                  "Start",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1.0),
                      fontSize: 18.0),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              RawMaterialButton(
                onPressed: () {
                  setState(() {
                    if (timer != null) {
                      timer!.cancel();
                    }
                    _startTimer(5);
                  });
                },
                fillColor: AppColor.secondColor,
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 64.0),
                child: Text(
                  "break",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1.0),
                      fontSize: 18.0),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              RawMaterialButton(
                onPressed: () {
                  setState(() {
                    if (timer != null) {
                      timer!.cancel();
                    }
                  });
                },
                fillColor: AppColor.secondColor,
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 64.0),
                child: Text(
                  "stop",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1.0),
                      fontSize: 18.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
