import 'package:fire_base/utils/firebase_helper/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
              "Sign In",
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
                              FireBaseHelper.fireBaseHelper.signIn(email: txtusername.text, password: txtpassword.text);
                              Get.toNamed('/home');

                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            child: Text("Sign in"),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed('/signup');
                            },
                            child: Text(
                              "Didn't have an account? Sign Up",
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
            InkWell(
              onTap: () async {
                String? msg = await FireBaseHelper.fireBaseHelper.googleSignIn();
                Get.snackbar("$msg", "FireBase");
                Get.offAndToNamed('/home');
              },
              child: Container(
                height: 100,
                width: 100,
                color: Colors.black,
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
    );
  }
}