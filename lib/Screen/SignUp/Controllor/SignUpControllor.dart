import 'package:fire_app/Utiles/FireHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpControllor extends GetxController {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  RxBool isPass = false.obs;



  Future<String?> SignUp({required email, required password}) async {
    return await FireHelper.fireHelper.SignUp(
      email: email,
      password: password,
    );
  }
}
