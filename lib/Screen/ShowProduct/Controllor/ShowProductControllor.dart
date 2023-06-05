import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_app/Utiles/FireHelper.dart';
import 'package:get/get.dart';

class ShowProductControllor extends GetxController {


  Stream<QuerySnapshot<Map<String, dynamic>>> ReadData() {
    return FireHelper.fireHelper.readData();
  }

}
