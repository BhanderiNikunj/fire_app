import 'package:fire_app/Screen/SignUp/Controllor/SignUpControllor.dart';
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
        body: Stack(
          children: [
            Container(
              height: 200.h,
              color: Colors.white,
            ),
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
                          "SignUp",
                          style: TextStyle(
                            fontSize: 25.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 40.sp),
                        TextField(
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          controller: signUpControllor.txtEmail,
                          decoration: InputDecoration(
                            label: const Text(
                              "Enter Email Address",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.sp),
                        TextField(
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          controller: signUpControllor.txtPass,
                          decoration: InputDecoration(
                            label: const Text(
                              "Enter Password",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.sp),
                        InkWell(
                          onTap: () async {
                            String? msg = await signUpControllor.SignUp(
                              email: signUpControllor.txtEmail.text,
                              password: signUpControllor.txtPass.text,
                            );

                            Get.snackbar(
                              "$msg",
                              "",
                            );
                            Get.back();
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
                              "Create",
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
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    "You Have Already Account? SignIn",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
