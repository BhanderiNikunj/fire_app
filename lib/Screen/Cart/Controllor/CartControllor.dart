import 'package:fire_app/Screen/Cart/Model/CartModel.dart';
import 'package:get/get.dart';

class CartContollor extends GetxController {
  List<CartModel> CartDataList = [];

  int subTotal = 0;
  int discount = 20;
  int delivery = 100;
  int total = 0;

  int Quantity = 1;
}
