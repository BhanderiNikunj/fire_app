import 'package:fire_app/Screen/Login/Controllor/LoginControllor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginControllor loginControllor = Get.put(
    LoginControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: 200.h,
              color: Colors.white,
            ),
            Column(
              children: [
                SizedBox(height: 20.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.sp),
                      child: Text(
                        "Welcome To Education App",
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 75.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.sp),
                    topRight: Radius.circular(30.sp),
                  ),
                  color: Colors.black,
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0.sp),
                  child: Container(
                    height: 50.sp,
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(height: 20.sp),
                        Text(
                          "Education",
                          style: TextStyle(
                            fontSize: 30.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20.sp),
                        Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 25.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 40.sp),
                        TextField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          controller: loginControllor.txtEmail,
                          decoration: InputDecoration(
                            label: Text(
                              "Enter Email Address",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.sp),
                        TextField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          controller: loginControllor.txtPassword,
                          decoration: InputDecoration(
                            label: Text(
                              "Enter Password",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.sp),
                        InkWell(
                          onTap: () async {
                            String? msg = await loginControllor.LogIn(
                              email: loginControllor.txtEmail.text,
                              password: loginControllor.txtPassword.text,
                            );

                            Get.snackbar(
                              "$msg",
                              "",
                            );

                            if (msg == "success") {
                              Get.toNamed('/home');
                            } else {
                              Get.toNamed('/signUp');
                            }
                          },
                          child: Container(
                            height: 40.sp,
                            width: 80.sp,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
