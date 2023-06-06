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
        // appBar: AppBar(
        //   backgroundColor: Colors.black,
        //   actions: [
        //     IconButton(
        //       onPressed: () {
        //         FireHelper.fireHelper.SignOut();
        //         Get.offAndToNamed('/logIn');
        //       },
        //       icon: Icon(
        //         Icons.logout,
        //       ),
        //     ),
        //   ],
        // ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_sharp,
                        color: Colors.red,
                      ),
                      Text(
                        "Location",
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.pink,
                  ),
                ],
              ),
              SizedBox(height: 20.sp),
              Center(
                child: Container(
                  height: 35.sp,
                  width: 300.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffFFF0F0),
                        Color(0xffFFDFDF),
                      ],
                    ),
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
                        var image = data['image'];
                        var types = data['types'];
                        var oder_list = data['oder_list'];

                        HomeModel homeModel = HomeModel(
                          size: size,
                          name: name,
                          brand: brand,
                          desc: desc,
                          discount: discount,
                          price: price,
                          rate: rate,
                          key: x.id,
                          image: image,
                          types: types,
                          oder_List: oder_list,
                        );

                        print(oder_list);
                        homeControllor.DataList.add(homeModel);
                      }
                      return Column(
                        children: [
                          Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 175.sp,
                              ),
                              itemCount: homeControllor.DataList.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    HomeModel homeModel = HomeModel(
                                      name: homeControllor.DataList[index].name,
                                      oder_List: homeControllor
                                          .DataList[index].oder_List,
                                      types:
                                          homeControllor.DataList[index].types,
                                      key: homeControllor.DataList[index].key,
                                      size: homeControllor.DataList[index].size,
                                      desc: homeControllor.DataList[index].desc,
                                      discount: homeControllor
                                          .DataList[index].discount,
                                      price:
                                          homeControllor.DataList[index].price,
                                      rate: homeControllor.DataList[index].rate,
                                      brand:
                                          homeControllor.DataList[index].brand,
                                      image:
                                          homeControllor.DataList[index].image,
                                    );
                                    Get.toNamed('/show', arguments: homeModel);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                        ),
                                      ],
                                      color: Colors.white,
                                    ),
                                    margin: EdgeInsets.all(10),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "⭐️ ${homeControllor.DataList[index].rate}",
                                          ),
                                          Container(
                                            height: 60.sp,
                                            child: Image.network(
                                                "${homeControllor.DataList[index].image}"),
                                          ),
                                          Container(
                                            height: 20.sp,
                                            child: Text(
                                              "${homeControllor.DataList[index].name}",
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5.sp),
                                          Container(
                                            height: 10.sp,
                                            child: Text(
                                              "${homeControllor.DataList[index].desc}",
                                              style: TextStyle(
                                                fontSize: 8.sp,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 15.sp),
                                          Container(
                                            height: 30,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "\$ ${homeControllor.DataList[index].price}.00",
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Container(
                                                  height: 30.sp,
                                                  width: 30.sp,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.pink,
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
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
      ),
    );
  }
}
