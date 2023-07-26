import 'package:chatapp/core/routes/routes.dart';
import 'package:chatapp/pages/Register_page.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0Xff274460),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: Column(
          children: [
            Spacer(
              flex: 2,
            ),
            Image.asset('assets/images/scholar.png'),
            Text(
              "chat app",
              style: TextStyle(
                  fontSize: 32, fontFamily: 'pacifico', color: Colors.white),
            ),
            Spacer(
              flex: 2,
            ),
            Row(
              children: [
                Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
              ],
            ),
            SizedBox(
              height: 17,
            ),
            CustomeField(hintString: "Email"),
            SizedBox(
              height: 13,
            ),
            CustomeField(
              hintString: 'Password',
            ),
            SizedBox(
              height: 13,
            ),
            CustomButton(text: 'Login'),
            SizedBox(
              height: 17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'dont have an account?',
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
                GestureDetector(
                  onTap: (){
Navigator.pushNamed(context, routes.Register)    ;              },
                  child: Text(
                    " Register",
                    style: TextStyle(color: Color(0XffC5E7E5), fontSize: 19),
                  ),
                ),
              ],
            ),
            Spacer(flex: 5)
          ],
        ),
      ),
    );
  }
}
