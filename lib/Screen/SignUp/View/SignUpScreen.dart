import 'package:fire_app/Screen/SignUp/Controllor/SignUpControllor.dart';
import 'package:fire_app/Utiles/FireHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpControllor signUpControllor = Get.put(
    SignUpControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("FireBase App"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: signUpControllor.txtEmail,
                  decoration: InputDecoration(
                    label: Text("Enter Your Email Address"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                    ),
                  ),
                ),
                SizedBox(height: 10.sp),
                TextField(
                  controller: signUpControllor.txtPass,
                  obscureText: true,
                  decoration: InputDecoration(
                    label: Text("Enter Your Password"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                    ),
                  ),
                ),
                SizedBox(height: 10.sp),
                ElevatedButton(
                  onPressed: () {
                    String email = signUpControllor.txtEmail.text;
                    String password = signUpControllor.txtPass.text;

                    FireHelper.fireHelper.SignUp(
                      email: email,
                      password: password,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: Text(
                    "SignUp",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
