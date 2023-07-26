import 'package:chatapp/core/routes/routes.dart';
import 'package:chatapp/pages/Register_page.dart';
import 'package:chatapp/pages/login_page.dart';
import 'package:chatapp/widgets/custom_button.dart';
import 'package:chatapp/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: routes.Login,
      routes: {
        routes.Login :(context)=> const Login(),
        routes.Register :(context)=> const Register()
      },
      home: Login(),
    );
  }
}

