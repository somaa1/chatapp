import 'package:flutter/material.dart';

import '../constant.dart';
class chatbubble extends StatelessWidget {
  const chatbubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20),
      height: 60,
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32)),
        color: KPrimryColor,
      ),
      child:
      Text(
        "iam somaa",
        style: TextStyle(color: Colors.white60),
      ),

    );
  }
}