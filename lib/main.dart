import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Stone-Paper-Scissors'),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: StonePapaerScissors(),
      ),
    ),
  );
}

class StonePapaerScissors extends StatefulWidget {
  @override
  _StonePapaerScissorsState createState() => _StonePapaerScissorsState();
}

class _StonePapaerScissorsState extends State<StonePapaerScissors> {
  int sf = 1;
  int sf2 = 1;

  int total = 0;
  int me = 0;
  int you = 0;

  String sft = " ";
  String sft2 = " ";
  String st = "Tap on any Button ";
  void suffleNum() {
    setState(() {
      total++;
      sf = Random().nextInt(3) + 1;
      sf2 = Random().nextInt(3) + 1;

      //=====================================
      if (sf == 1) {
        sft = "Stone";
      } else if (sf == 2) {
        sft = "Paper";
      } else {
        sft = "Scissor";
      }
      if (sf2 == 1) {
        sft2 = "Stone";
      } else if (sf2 == 2) {
        sft2 = "Paper";
      } else {
        sft2 = "Scissor";
      }

      //=====================================
      if ((sft == "Stone") && (sft2 == "Scissor")) {
        st = "I Won";
        me++;
      } else if ((sft == "Stone") && (sft2 == "Paper")) {
        st = "You Won";
        you++;
      } else if ((sft == "Stone") && (sft2 == "Stone")) {
        st = "Tie";
      } else if ((sft == "Paper") && (sft2 == "Stone")) {
        st = "I Won";
        me++;
      } else if ((sft == "Paper") && (sft2 == "Scissor")) {
        st = "You Won";
        you++;
      } else if ((sft == "Paper") && (sft2 == "Paper")) {
        st = "Tie";
      } else if ((sft == "Scissor") && (sft2 == "Paper")) {
        st = "I Won";
        me++;
      } else if ((sft == "Scissor") && (sft2 == "Stone")) {
        st = "You Won";
        you++;
      } else if ((sft == "Scissor") && (sft2 == "Scissor")) {
        st = "Tie";
      }
    });
  }

  void resetCount() {
    setState(() {
      total = 0;
      me = 0;
      you = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 80.0, 0, 0),
            child: Text(
              '$st\n\nTotal: $total',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                letterSpacing: 0.8,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 95.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  child: Image.asset('images/ssp_$sf.png'),
                  onPressed: () {
                    suffleNum();
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  child: Image.asset('images/ssp_$sf2.png'),
                  onPressed: () {
                    suffleNum();
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text(
                  'Me\n$me',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'You\n$you',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 45.0,
          ),
          FlatButton(
            onPressed: () {
              resetCount();
            },
            child: Text(
              'Reset',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
