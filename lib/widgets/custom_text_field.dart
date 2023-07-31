import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  String? hintString;
  Function(String)? onChanged;
bool? obscureText;
  CustomFormField({required this.hintString, this.onChanged, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'data cant be empty';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintString,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
