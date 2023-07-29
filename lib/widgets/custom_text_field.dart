import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  String? hintString;
  Function(String)? onChanged;

  CustomFormField({required this.hintString, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
