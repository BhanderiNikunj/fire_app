import 'package:fire_app/Screen/Bottom/Controllor/BottomControllor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key});

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  BottomControllor bottomControllor = Get.put(
    BottomControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: bottomControllor.Screen[bottomControllor.bottom],
        bottomNavigationBar: WaterDropNavBar(
          barItems: [
            BarItem(
              filledIcon: Icons.home,
              outlinedIcon: Icons.home_outlined,
            ),
            BarItem(
              filledIcon: Icons.shopping_cart,
              outlinedIcon: Icons.shopping_cart_outlined,
            ),
          ],
          inactiveIconColor: Colors.pink.shade200,
          waterDropColor: Colors.pink,
          selectedIndex: bottomControllor.bottom,
          onItemSelected: (index) {
            setState(() {
              bottomControllor.bottom = index;
            });
          },
        ),
      ),
    );
  }
}
