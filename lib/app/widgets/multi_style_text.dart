import 'package:flutter/material.dart';

class MySpanText extends StatelessWidget {

  MySpanText(String text, int fontSize, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: TextStyle(color: Colors.blue), //apply style to all
            children: [
          TextSpan(
              text: 'This is', style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: ' FlutterCampus', style: TextStyle(fontSize: 25)),
          TextSpan(
              text: ' Learn Flutter.',
              style: TextStyle(fontStyle: FontStyle.italic))
        ]));
  }
}
