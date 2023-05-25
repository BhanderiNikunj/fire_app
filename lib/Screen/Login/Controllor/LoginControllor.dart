import 'package:fire_app/Utiles/FireHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginControllor extends GetxController {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  Future<String?> LogIn({required email, required password}) {
    return FireHelper.fireHelper.LogIn(
      email: email,
      password: password,
    );
  }
}
