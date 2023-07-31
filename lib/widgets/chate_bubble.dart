import 'package:chatapp/models/message.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class chatbubble extends StatelessWidget {
  Messages message;
  VoidCallback? send;

  chatbubble({super.key, required this.message,this.send});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 16, bottom: 16, right: 16),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32)),
          color: KPrimryColor,
        ),
        child: GestureDetector(
       onLongPress: send,
          child: Text(
            message.message,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class chatbubbleforFriend extends StatelessWidget {
  Messages message;

  chatbubbleforFriend({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 16, bottom: 16, right: 16),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32)),
          color: KSecondryColor,
        ),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
