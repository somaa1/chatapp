import 'package:chatapp/core/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constant.dart';
import '../helper/showsnackbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                const SizedBox(
                  height: 85,
                ),
                Image.asset(
                  'assets/images/scholar.png',
                  height: 100,
                ),
                const Row(
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
                const SizedBox(
                  height: 50,
                ),
                const Row(
                  children: [
                    Text(
                      "Register",
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 17,
                ),
                CustomFormField(
                  hintString: "Email",
                  onChanged: (data) {
                    email = data;
                  },
                ),
                const SizedBox(
                  height: 13,
                ),
                CustomFormField(
                  hintString: 'Password',
                  onChanged: (data) {
                    password = data;
                  },
                ),
                const SizedBox(
                  height: 13,
                ),
                CustomButton(
                  text: 'Register',
                  OnTap: () async {
                    if (formKey.currentState!.validate()) {
                      isloading=true;
                      setState(() {

                      });
                      try {
                        await RegisterUser();
                        ShowSnackBar(context, 'createdSuccessfully');

                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'weak-password') {
                          ShowSnackBar(context, 'weak-password');
                        } else if (ex.code == 'email-already-in-use') {
                          ShowSnackBar(context, ' email-already-in-use');
                        }
                      } catch (ex) {
                        ShowSnackBar(context, 'error');
                      }
                      isloading=false;
                      setState(() {

                      });

                    } else {

                    }
                  },
                ),
                const SizedBox(
                  height: 17,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'dont have an account?',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        " Login",
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


  Future<void> RegisterUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
  }
}
