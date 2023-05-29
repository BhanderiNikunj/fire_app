import 'package:fire_app/Utiles/FireHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: IconButton(
            onPressed: () async {
              FireHelper.fireHelper.SignOut();
              Get.offAndToNamed('/logIn');
            },
            icon: Icon(
              Icons.logout_outlined,
            ),
          ),
        ),
      ),
    );
  }
}
