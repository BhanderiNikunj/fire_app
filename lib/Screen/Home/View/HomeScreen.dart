import 'package:fire_app/Screen/Home/Controllor/HomeControllor.dart';
import 'package:fire_app/Utiles/FireHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeControllor homeControllor = Get.put(
    HomeControllor(),
  );

  @override
  void initState() {
    super.initState();

    homeControllor.userDetail.value = FireHelper.fireHelper.UserData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        drawer: Drawer(
          child: Padding(
            padding: EdgeInsets.all(10.sp),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30.sp,
                  backgroundImage:
                      NetworkImage("${homeControllor.userDetail['image']}"),
                ),
                SizedBox(height: 10.sp),
                Text(
                  "Name :- ${homeControllor.userDetail['name']}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.sp),
                Text(
                  "Email :- ${homeControllor.userDetail['email']}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.sp),
                Text(
                  "Email :- ${homeControllor.userDetail['email']}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        // body: Center(
        //   child: IconButton(
        //     onPressed: () async {
        //       FireHelper.fireHelper.SignOut();
        //       Get.offAndToNamed('/logIn');
        //     },
        //     icon: Icon(
        //       Icons.logout_outlined,
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
