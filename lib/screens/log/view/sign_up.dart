import 'package:fire_base/utils/firebase_helper/firebase_helper.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              FireBaseHelper.fireBaseHelper.signUp(email: "email", password: "password");
            },
            child: Text("SignUp"),
          ),
        ),
      ),
    );
  }
}
