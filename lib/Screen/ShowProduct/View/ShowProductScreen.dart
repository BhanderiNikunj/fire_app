import 'package:fire_app/Screen/Home/Model/HomeModel.dart';
import 'package:fire_app/Screen/ShowProduct/Controllor/ShowProductControllor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ShowProductScreen extends StatefulWidget {
  const ShowProductScreen({Key? key}) : super(key: key);

  @override
  State<ShowProductScreen> createState() => _ShowProductScreenState();
}

class _ShowProductScreenState extends State<ShowProductScreen> {
  ShowProductControllor showProductControllor = Get.put(
    ShowProductControllor(),
  );

  HomeModel homeModel = Get.arguments;

  @override
  void initState() {
    super.initState();

    print(homeModel.oder_List);
  }

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
                    "${homeModel.image}",
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
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 3,
                      blurRadius: 5,
                      color: Colors.black12,
                    )
                  ],
                  color: Color(0xffffffff),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.sp,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30.sp,
                            width: 70.sp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Color(0xffffe5e5),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "${homeModel.types}",
                              style: TextStyle(
                                color: Color(0xffD61355),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 30.sp,
                                width: 30.sp,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFE5E5),
                                  shape: BoxShape.circle,
                                ),
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.location_on,
                                  color: Color(0xffD61355),
                                ),
                              ),
                              SizedBox(width: 8.sp),
                              Container(
                                height: 30.sp,
                                width: 30.sp,
                                decoration: BoxDecoration(
                                  color: Color(0xffe5e5e5),
                                  shape: BoxShape.circle,
                                ),
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Container(
                        child: Text(
                          "${homeModel.name}",
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 30.sp,
                            width: 120.sp,
                            child: Row(
                              children: [
                                Text(
                                  "⭐️",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${homeModel.rate} Rating",
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black26,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 30.sp,
                            width: 120.sp,
                            child: Row(
                              children: [
                                Text(
                                  "🛍️",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${homeModel.oder_List}+ Order",
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black26,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.sp),
                      Container(
                        child: Text(
                          "${homeModel.desc}",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 15.sp,
                top: 15.sp,
              ),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 30.sp,
                  width: 30.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.sp),
                    color: Color(0xffEF9FB7),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 15.sp,
                    color: Color(0xffFF0000),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      showProductControllor.AddToCart(
                        h1: homeModel,
                      );
                    },
                    child: Container(
                      height: 40.sp,
                      width: double.infinity,
                      padding: EdgeInsets.all(10.sp),
                      margin: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            spreadRadius: 5,
                            color: Colors.black12,
                          )
                        ],
                        color: Color(0xffD61355),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Add To Cart",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
