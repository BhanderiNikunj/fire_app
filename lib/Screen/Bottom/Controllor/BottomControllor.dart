import 'package:fire_app/Screen/Cart/View/CartScreen.dart';
import 'package:fire_app/Screen/Home/View/HomeScreen.dart';
import 'package:fire_app/Screen/Profile/View/ProfileScreen.dart';
import 'package:get/get.dart';

class BottomControllor extends GetxController {
  int bottom = 0;
  List Screen = [
    HomeScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
}
