import 'package:fire_app/Utiles/FireHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddDetailControllor extends GetxController {
  TextEditingController txtfname = TextEditingController();
  TextEditingController txtlname = TextEditingController();
  TextEditingController txtmobileno = TextEditingController();
  TextEditingController txtAddress = TextEditingController();

  Future<String> insertUserDetail({
    required f_name,
    required l_name,
    required mobile_no,
    required address,
  }) {
    return FireHelper.fireHelper.insertUserDetail(
      f_name: f_name,
      l_name: l_name,
      mobile_no: mobile_no,
      address: address,
    );
  }
}
