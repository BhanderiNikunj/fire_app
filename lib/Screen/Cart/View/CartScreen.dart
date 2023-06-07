import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_app/Screen/Cart/Controllor/CartControllor.dart';
import 'package:fire_app/Screen/Cart/Model/CartModel.dart';
import 'package:fire_app/Screen/Home/Model/HomeModel.dart';
import 'package:fire_app/Utiles/FireHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartContollor cartControllor = Get.put(
    CartContollor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: FireHelper.fireHelper.readUserCart(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              var snapData = snapshot.data;
              cartControllor.CartDataList.clear();
              for (var x in snapData!.docs) {
                var data = x.data();

                CartModel cartModel = CartModel(
                  image: data['image'],
                  name: data['name'],
                  rate: data['rate'],
                  price: data['price'],
                  discount: data['discount'],
                  desc: data['desc'],
                  size: data['size'],
                );

                cartControllor.CartDataList.add(cartModel);
                print("hello");
              }

              print(cartControllor.CartDataList.length);
              return Padding(
                padding: EdgeInsets.all(10.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.sp),
                    Text(
                      "Order Details",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 30.sp),
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartControllor.CartDataList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 80.sp,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.sp),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    spreadRadius: 5,
                                    color: Colors.black12,
                                  )
                                ],
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 7.sp),
                                  Container(
                                    height: 70.sp,
                                    width: 70.sp,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                      color: Colors.black12,
                                    ),
                                    alignment: Alignment.center,
                                    child: Image.network(
                                      "${cartControllor.CartDataList[index].image}",
                                      fit: BoxFit.cover,
                                      height: 70.sp,
                                      width: 70.sp,
                                    ),
                                  ),
                                  SizedBox(width: 10.sp),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "${cartControllor.CartDataList[index].name}",
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Container(
                                        width: 90.sp,
                                        height: 10.sp,
                                        child: Text(
                                          overflow: TextOverflow.ellipsis,
                                          "${cartControllor.CartDataList[index].desc}",
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: Colors.black26,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "\$ ${cartControllor.CartDataList[index].price}",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Color(0xffD61355),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 80.sp,
                                    width: 120,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 25.sp,
                                            width: 25.sp,
                                            decoration: BoxDecoration(
                                              color: Color(0xffFDE6E9),
                                              borderRadius:
                                                  BorderRadius.circular(5.sp),
                                            ),
                                            alignment: Alignment.center,
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "0",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 25.sp,
                                            width: 25.sp,
                                            decoration: BoxDecoration(
                                              color: Color(0xffD61355),
                                              borderRadius:
                                                  BorderRadius.circular(5.sp),
                                            ),
                                            alignment: Alignment.center,
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
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
                        },
                      ),
                    )
                  ],
                ),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
