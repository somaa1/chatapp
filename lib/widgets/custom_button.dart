import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
String? text;

  CustomButton({ required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(7)),
        child:  Text(text!,style: TextStyle(fontSize: 24),));
  }
}
