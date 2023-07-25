import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return               Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white ,

            borderRadius: BorderRadius.circular(5)
        ),
        child: Text("Sign in"))
    ;
  }
}
