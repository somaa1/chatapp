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
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0Xff274460),
      body:

      Column(
          children: [
            Image.asset('assets/images/scholar.png'),
            Text("data"),
            TextFormField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            TextField(

              decoration: InputDecoration(
                enabledBorder:OutlineInputBorder(

                  borderSide: BorderSide(color: Colors.white),) ,
                border: OutlineInputBorder(

                    borderSide: BorderSide(color: Colors.white),),

              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Sign in")),
            Row(
              children: [Text('dont have an account'), Text("Sign Up")],
            )
          ],
        ),

    );
  }
}
