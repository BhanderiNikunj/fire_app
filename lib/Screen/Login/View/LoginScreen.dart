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
              color: Colors.black87,
            ),
            Center(
              child: Container(
                height: 50.h,
                width: 75.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  border: Border.all(color: Colors.white),
                  // color: Colors.white70,
                  color: Colors.white60,
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: Column(
                    children: [
                      SizedBox(height: 20.sp),
                      Text(
                        "LogIn",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.sp,
                        ),
                      ),
                      SizedBox(height: 30.sp),
                      TextField(
                        controller: loginControllor.txtEmail,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                          ),
                          prefixIconColor: Colors.black45,
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          label: Text("Email Address"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.sp),
                      Obx(
                        () => TextField(
                          obscureText: loginControllor.isPass.value == true
                              ? false
                              : true,
                          controller: loginControllor.txtPassword,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                            ),
                            prefixIconColor: Colors.black45,
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            label: Text("Password"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Obx(
                                () => Checkbox(
                                  activeColor: Colors.black,
                                  value: loginControllor.isPass.value,
                                  onChanged: (value) {
                                    loginControllor.isPass.value = value!;
                                  },
                                ),
                              ),
                              Text(
                                "Show Password",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Forgot Password ? ",
                          ),
                        ],
                      ),
                      SizedBox(height: 15.sp),
                      Container(
                        height: 35.sp,
                        width: 80.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(color: Colors.black87),
                          color: Colors.black54,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
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
