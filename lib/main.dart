import 'package:fire_app/Screen/AddData/View/AddDataScreen.dart';
import 'package:fire_app/Screen/Home/View/HomeScreen.dart';
import 'package:fire_app/Screen/Login/View/LoginScreen.dart';
import 'package:fire_app/Screen/SignUp/View/SignUpScreen.dart';
import 'package:fire_app/Screen/splesh/View/SpleshScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(
            name: '/',
            page: () => SpleshScreen(),
          ),
          GetPage(
            name: '/logIn',
            page: () => LoginScreen(),
          ),
          GetPage(
            name: '/signUp',
            page: () => SignUpScreen(),
          ),
          GetPage(
            name: '/home',
            page: () => HomeScreen(),
          ),
          GetPage(
            name: '/addData',
            page: () => AddDataScreen(),
          ),
        ],
      ),
    ),
  );
}
