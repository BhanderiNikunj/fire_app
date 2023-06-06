import 'package:fire_app/Screen/Home/Model/HomeModel.dart';
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

  RxString category = "boots".obs;

  Future<void> AddData({
    required HomeModel h1,
  }) async {
    await FireHelper.fireHelper.AddData(
      name: h1.name,
      price: h1.price,
      discount: h1.discount,
      rate: h1.rate,
      desc: h1.desc,
      brand: h1.brand,
      size: h1.size,
      image: "",
    );
  }

  void updateData({
    required HomeModel h1,
  }) {
    FireHelper.fireHelper.UpdateData(
      key: h1.key,
      name: h1.name,
      price: h1.price,
      discount: h1.discount,
      rate: h1.rate,
      desc: h1.desc,
      brand: h1.brand,
      size: h1.size,
      image: "",
    );
  }
}
