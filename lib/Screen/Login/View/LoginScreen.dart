import 'package:fire_app/Screen/Login/Controllor/LoginControllor.dart';
import 'package:fire_app/Utiles/FireHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        // backgroundColor: Color(0xff201A30),
        body: Padding(
          padding: EdgeInsets.all(8.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 12.h),
                Center(
                  child: Text(
                    "LogIn",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp,
                    ),
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
                    obscureText:
                        loginControllor.isPass.value == true ? false : true,
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
                InkWell(
                  onTap: () async {
                    String? msg = await loginControllor.LogIn(
                      email: loginControllor.txtEmail.text,
                      password: loginControllor.txtPassword.text,
                    );

                    Get.snackbar("$msg", "");

                    if (msg == "success") {
                      Get.offAndToNamed('/home');
                    }
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
                      "LOGIN",
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
                    Get.toNamed('/signUp');
                  },
                  child: Text(
                    "You Have Create Account ? SignUp",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 15.sp),
                InkWell(
                  onTap: () async {
                    UserCredential user =
                        await FireHelper.fireHelper.signInWithGoogle();
                    // ignore: unnecessary_null_comparison
                    if (user == null) {
                      Get.snackbar("title", "message");
                    } else {
                      Get.offAndToNamed('/home');
                    }
                  },
                  child: Image.asset(
                    "Assets/Images/Google1.png",
                    height: 40.sp,
                  ),
                ),
                SizedBox(height: 10.sp),
                InkWell(
                  onTap: () async {
                    UserCredential user =
                        await FireHelper.fireHelper.signInWithGoogle();
                    // ignore: unnecessary_null_comparison
                    if (user == null) {
                      Get.snackbar("title", "message");
                    } else {
                      Get.offAndToNamed('/home');
                    }
                  },
                  child: Image.asset(
                    "Assets/Images/Facebook.png",
                    height: 40.sp,
                  ),
                ),
                SizedBox(height: 10.sp),
                InkWell(
                  onTap: () async {
                    UserCredential user =
                        await FireHelper.fireHelper.signInWithGoogle();
                    // ignore: unnecessary_null_comparison
                    if (user == null) {
                      Get.snackbar("title", "message");
                    } else {
                      Get.offAndToNamed('/home');
                    }
                  },
                  child: Image.asset(
                    "Assets/Images/Twitter.png",
                    height: 40.sp,
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
