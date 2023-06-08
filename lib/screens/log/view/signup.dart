import 'package:fire_base/utils/firebase_helper/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController txtusername = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Sign Up",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 350,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 40),
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border(
                  top: BorderSide(width: 1, color: Colors.green),
                  left: BorderSide(width: 1, color: Colors.green),
                  right: BorderSide(width: 1, color: Colors.green),
                  bottom: BorderSide(width: 1, color: Colors.green),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26, spreadRadius: 2, blurRadius: 8),
                ],
              ),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Enter Username :-"),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: txtusername,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Username",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Enter Password :-"),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: txtpassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Password",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      // padding: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              FireBaseHelper.fireBaseHelper.signUp(email: txtusername.text, password: txtpassword.text);
                              Get.toNamed('/');
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            child: Text("Sign up"),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed('/');
                            },
                            child: Text(
                              "Alredy have an account? Sign In",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // TextButton(
                    //   onPressed: () {},
                    //   child: Text(
                    //     "Didn't have an account? Sign Up",
                    //     style: TextStyle(color: Colors.red),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // TextButton(
            //   onPressed: () {},
            //   child: Text(
            //     "Didn't have an account? Sign Up",
            //     style: TextStyle(color: Colors.red),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}