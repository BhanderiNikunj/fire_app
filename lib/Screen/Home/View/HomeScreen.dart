import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_app/Screen/Home/Controllor/HomeControllor.dart';
import 'package:fire_app/Screen/Home/Model/HomeModel.dart';
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
          actions: [
            IconButton(
              onPressed: () {
                FireHelper.fireHelper.SignOut();
                Get.offAndToNamed('/logIn');
              },
              icon: Icon(
                Icons.logout,
              ),
            ),
          ],
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
        body: StreamBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              homeControllor.DataList.clear();
              QuerySnapshot? Snapdata = snapshot.data;
              for (var x in Snapdata!.docs) {
                Map data = x.data() as Map;

                var name = data['name'];
                var price = data['price'];
                var rate = data['rate'];
                var discount = data['discount'];
                var desc = data['desc'];
                var brand = data['brand'];
                var size = data['size'];

                HomeModel homeModel = HomeModel(
                  size: size,
                  name: name,
                  brand: brand,
                  desc: desc,
                  discount: discount,
                  price: price,
                  rate: rate,
                );

                homeControllor.DataList.add(homeModel);
              }
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {

                  print(homeControllor.DataList.length);
                  return Container(
                    child: Column(
                      children: [
                        Text("${homeControllor.DataList[index].name}",),
                        Text("${homeControllor.DataList[index].brand}",),
                        Text("${homeControllor.DataList[index].discount}",),
                        Text("${homeControllor.DataList[index].price}",),
                        Text("${homeControllor.DataList[index].rate}",),
                        Text("${homeControllor.DataList[index].desc}",),
                        Text("${homeControllor.DataList[index].size}",),
                      ],
                    ),
                  );
                },
                itemCount: homeControllor.DataList.length,
              );
            }
            return CircularProgressIndicator();
          },
          stream: homeControllor.ReadData(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('/addData');
          },
          backgroundColor: Colors.black,
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
