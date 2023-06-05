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
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       FireHelper.fireHelper.SignOut();
          //       Get.offAndToNamed('/logIn');
          //     },
          //     icon: Icon(
          //       Icons.logout,
          //     ),
          //   ),
          // ],
        ),
        // drawer: Drawer(
        //   child: Padding(
        //     padding: EdgeInsets.all(10.sp),
        //     child: Column(
        //       children: [
        //         CircleAvatar(
        //           radius: 30.sp,
        //           backgroundImage:
        //               NetworkImage("${homeControllor.userDetail['image']}"),
        //         ),
        //         SizedBox(height: 10.sp),
        //         Text(
        //           "Name :- ${homeControllor.userDetail['name']}",
        //           style: TextStyle(
        //             fontWeight: FontWeight.bold,
        //             fontSize: 12.sp,
        //             color: Colors.black,
        //           ),
        //         ),
        //         SizedBox(height: 10.sp),
        //         Text(
        //           "Email :- ${homeControllor.userDetail['email']}",
        //           style: TextStyle(
        //             fontWeight: FontWeight.bold,
        //             fontSize: 12.sp,
        //             color: Colors.black,
        //           ),
        //         ),
        //         SizedBox(height: 10.sp),
        //         Text(
        //           "Email :- ${homeControllor.userDetail['email']}",
        //           style: TextStyle(
        //             fontWeight: FontWeight.bold,
        //             fontSize: 12.sp,
        //             color: Colors.black,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.sp),
              Text(
                "Welcome",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(height: 5.sp),
              Text(
                "Our Fashion App",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(height: 20.sp),
              Center(
                child: Container(
                  height: 40.sp,
                  width: 300.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: Color(0xffF3F4F5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          height: 50.sp,
                          width: 50.sp,
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.search,
                          ),
                        ),
                        Container(
                          height: 50.sp,
                          width: 100.sp,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Search...",
                            style: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.sp),
              Expanded(
                child: StreamBuilder(
                  stream: homeControllor.ReadData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          "${snapshot.error}",
                        ),
                      );
                    } else if (snapshot.hasData) {
                      QuerySnapshot? snapData = snapshot.data;

                      homeControllor.DataList.clear();

                      for (var x in snapData!.docs) {
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
                      return Column(
                        children: [
                          Container(
                            height: 100.sp,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: homeControllor.DataList.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 150.sp,
                                  height: 100.sp,
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: Colors.grey,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.sp),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${homeControllor.DataList[index].discount}% off",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          "${homeControllor.DataList[index].name}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 15.sp),
                                        InkWell(
                                          onTap: () {
                                            Get.toNamed('/show',arguments: index,);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.sp),
                                              color: Colors.black,
                                            ),
                                            width: 35.sp,
                                            height: 15.sp,
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Get Now",
                                              style: TextStyle(
                                                fontSize: 8.sp,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                      // return Text("123");
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
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
