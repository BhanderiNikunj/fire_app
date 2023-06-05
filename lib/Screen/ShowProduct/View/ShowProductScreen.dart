import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_app/Screen/Home/Controllor/HomeControllor.dart';
import 'package:fire_app/Screen/Home/Model/HomeModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ShowProductScreen extends StatefulWidget {
  const ShowProductScreen({Key? key}) : super(key: key);

  @override
  State<ShowProductScreen> createState() => _ShowProductScreenState();
}

class _ShowProductScreenState extends State<ShowProductScreen> {
  HomeControllor homeControllor = Get.put(
    HomeControllor(),
  );

  int index = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Image.network(
                    height: 200.sp,
                    width: double.infinity,
                    "https://t4.ftcdn.net/jpg/02/29/75/83/360_F_229758328_7x8jwCwjtBMmC6rgFzLFhZoEpLobB6L8.jpg",
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 60.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.sp),
                    topLeft: Radius.circular(30.sp),
                  ),
                  color: Colors.black12,
                ),
                child: StreamBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          "${snapshot.error}",
                        ),
                      );
                    } else if (snapshot.hasData) {
                      QuerySnapshot? snapData = snapshot.data;

                      List<HomeModel> DataList = [];
                      // homeControllor.DataList.clear();

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

                        DataList.add(homeModel);
                      }
                      return Padding(
                        padding: EdgeInsets.all(15.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${DataList[index].name}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "${DataList[index].desc}",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "${DataList[index].rate}%",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: 60.sp,
                                      height: 25.sp,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.sp  ),
                                        color: Color(0xffeeeeee),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Icon(
                                              Icons.add,
                                            ),
                                          ),
                                          Text(
                                            "0",
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Icon(
                                              Icons.remove,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                    return CircularProgressIndicator();
                  },
                  stream: homeControllor.ReadData(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
