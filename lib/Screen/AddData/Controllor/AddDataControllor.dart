import 'package:fire_app/Utiles/FireHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddDataControllor extends GetxController {
  TextEditingController txtProductName = TextEditingController();
  TextEditingController txtProductPrice = TextEditingController();
  TextEditingController txtProductBrand = TextEditingController();
  TextEditingController txtProductRate = TextEditingController();
  TextEditingController txtProductDiscount = TextEditingController();
  TextEditingController txtProductDesc = TextEditingController();

  Future<void> AddData({
    required name,
    required price,
    required discount,
    required rate,
    required desc,
    required brand,
  }) async {
    await FireHelper.fireHelper.AddData(
      name: name,
      price: price,
      discount: discount,
      rate: rate,
      desc: desc,
      brand: brand,
    );
  }
}
