import 'dart:async';

import 'package:fire_app/Utiles/FireHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({Key? key}) : super(key: key);

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Get.offAndToNamed(FireHelper.fireHelper.checkLogin() == true ? '/home' : '/logIn');
    });


    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.network(
            "https://media.istockphoto.com/id/1311655397/vector/education-and-graduation-logo-design-vector.jpg?s=612x612&w=0&k=20&c=HLS9vxbhMsnjTv8J4Hncg01rPLySV0E-QxvY_H0BHoU=",
          ),
        ),
      ),
    );
  }
}
