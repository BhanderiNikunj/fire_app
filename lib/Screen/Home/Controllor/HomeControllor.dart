import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_app/Screen/Home/Model/HomeModel.dart';
import 'package:fire_app/Utiles/FireHelper.dart';
import 'package:get/get.dart';

class HomeControllor extends GetxController {
  RxMap userDetail = {}.obs;
  List<HomeModel> DataList = [];

  Stream<QuerySnapshot<Map<String, dynamic>>> ReadData() {
    return FireHelper.fireHelper.readData();
  }
}
