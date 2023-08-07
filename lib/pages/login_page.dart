import 'package:chatapp/core/routes/routes.dart';
import 'package:chatapp/pages/Register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constant.dart';
import '../helper/showsnackbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

var auth = FirebaseAuth.instance;

class _LoginState extends State<Login> {
  String? email, password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimryColor,
      body: ModalProgressHUD(
        inAsyncCall: isloading,
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: ListView(
              children: [
                SizedBox(
                  height: 85,
                ),
                Image.asset(
                  'assets/images/scholar.png',
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "chat app",
                      style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'pacifico',
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
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
                CustomFormField(
                    hintString: "Email",
                    onChanged: (data) {
                      email = data;
                    }),
                SizedBox(
                  height: 13,
                ),
                CustomFormField(
                  obscureText: true,
                  hintString: 'Password',
                  onChanged: (data) {
                    password = data;
                  },
                ),
                SizedBox(
                  height: 13,
                ),
                CustomButton(
                  text: 'Login',
                  OnTap: () async {
                    if (formKey.currentState!.validate()) {
                      isloading = true;
                      setState(() {});
                      try {
                        await LoginUser();
                        ShowSnackBar(context, 'suscees');
                        Navigator.pushNamed(context, routes.Chat,
                            arguments: email.toString());
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          ShowSnackBar(
                              context, 'No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          ShowSnackBar(context,
                              ' wrong password provided for that user.');
                        }
                      } catch (e) {
                        ShowSnackBar(context, '$e');
                      }

                      isloading = false;
                      setState(() {});
                    } else {}
                  },
                ),
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
                      onTap: () {
                        Navigator.pushNamed(context, routes.Register);
                      },
                      child: Text(
                        " Register",
                        style:
                            TextStyle(color: Color(0XffC5E7E5), fontSize: 19),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> LoginUser() async {
    UserCredential user = await auth.signInWithEmailAndPassword(
        email: email!, password: password!);
  }
}
