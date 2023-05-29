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
              color: Colors.black87,
            ),
            Center(
              child: Container(
                height: 55.h,
                width: 75.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  border: Border.all(color: Colors.white),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: Column(
                    children: [
                      SizedBox(height: 20.sp),
                      Text(
                        "SignUp",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.sp,
                        ),
                      ),
                      SizedBox(height: 30.sp),
                      TextField(
                        controller: signUpControllor.txtEmail,
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
                          obscureText: signUpControllor.isPass.value == true
                              ? false
                              : true,
                          controller: signUpControllor.txtPassword,
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
                        children: [
                          Row(
                            children: [
                              Obx(
                                () => Checkbox(
                                  activeColor: Colors.black,
                                  value: signUpControllor.isPass.value,
                                  onChanged: (value) {
                                    signUpControllor.isPass.value = value!;
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
                        ],
                      ),
                      SizedBox(height: 15.sp),
                      InkWell(
                        onTap: () {
                          signUpControllor.SignUp(
                            email: signUpControllor.txtEmail.text,
                            password: signUpControllor.txtPassword.text,
                          );

                          Get.back();
                        },
                        child: Container(
                          height: 35.sp,
                          width: 80.sp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            border: Border.all(color: Colors.black87),
                            color: Colors.black54,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "SignUp",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.sp),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "Already Have Account ? SignUp",
                          style: TextStyle(
                            color: Colors.black,
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
