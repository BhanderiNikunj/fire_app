import 'package:fire_app/Screen/AddData/Controllor/AddDataControllor.dart';
import 'package:fire_app/Screen/Home/Model/HomeModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({Key? key}) : super(key: key);

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  AddDataControllor addDataControllor = Get.put(
    AddDataControllor(),
  );

  HomeModel homeModel = Get.arguments;

  @override
  void initState() {
    super.initState();

    homeModel.checkUpdate == 1 ? NewData() : OldData();
  }

  void NewData() {
    addDataControllor.txtProductName =
        TextEditingController(text: "${homeModel.name}");
    addDataControllor.txtProductDiscount =
        TextEditingController(text: "${homeModel.discount}");
    addDataControllor.txtProductRate =
        TextEditingController(text: "${homeModel.rate}");
    addDataControllor.txtProductDesc =
        TextEditingController(text: "${homeModel.desc}");
    addDataControllor.txtProductBrand =
        TextEditingController(text: "${homeModel.brand}");
    addDataControllor.txtProductPrice =
        TextEditingController(text: "${homeModel.price}");
  }

  void OldData() {
    addDataControllor.txtProductName = TextEditingController();
    addDataControllor.txtProductRate = TextEditingController();
    addDataControllor.txtProductDesc = TextEditingController();
    addDataControllor.txtProductBrand = TextEditingController();
    addDataControllor.txtProductPrice = TextEditingController();
    addDataControllor.txtProductDiscount = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Product"),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: addDataControllor.txtProductName,
                  decoration: InputDecoration(
                    label: Text("Enter Product Name"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.sp),
                TextField(
                  controller: addDataControllor.txtProductPrice,
                  decoration: InputDecoration(
                    label: Text("Enter Product Price"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.sp),
                TextField(
                  controller: addDataControllor.txtProductBrand,
                  decoration: InputDecoration(
                    label: Text("Enter Product Brand"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.sp),
                TextField(
                  controller: addDataControllor.txtProductRate,
                  decoration: InputDecoration(
                    label: Text("Enter Product Rate"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.sp),
                TextField(
                  controller: addDataControllor.txtProductDiscount,
                  decoration: InputDecoration(
                    label: Text("Enter Product Discount"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.sp),
                // Obx(
                //   () => DropdownButton(
                //     value: addDataControllor.category.value,
                //     isExpanded: true,
                //     items: [
                //       DropdownMenuItem(
                //         value: "cloths",
                //         child: Text(
                //           "Cloths",
                //         ),
                //       ),
                //       DropdownMenuItem(
                //         value: "boots",
                //         child: Text(
                //           "Boots",
                //         ),
                //       ),
                //       DropdownMenuItem(
                //         value: "bags",
                //         child: Text(
                //           "Bags",
                //         ),
                //       ),
                //     ],
                //     onChanged: (value) {
                //       addDataControllor.category.value = value!;
                //     },
                //   ),
                // ),
                // SizedBox(height: 10.sp),
                // Container(
                //   height: 50.sp,
                //   width: double.infinity,
                //   child: ListView.builder(
                //     itemBuilder: (context, index) {
                //       return Container(
                //         width: 30.sp,
                //         height: 30.sp,
                //         decoration: BoxDecoration(
                //           shape: BoxShape.circle,
                //           color: Colors.black,
                //         ),
                //       );
                //     },
                //     itemCount: 3,
                //   ),
                // ),
                SizedBox(height: 10.sp),
                TextField(
                  controller: addDataControllor.txtProductDesc,
                  maxLines: 3,
                  decoration: InputDecoration(
                    label: Text("Enter Product Description"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (homeModel.checkUpdate == 0) {
                      HomeModel home = HomeModel(
                        rate: addDataControllor.txtProductRate.text,
                        price: addDataControllor.txtProductPrice.text,
                        discount: addDataControllor.txtProductDiscount.text,
                        desc: addDataControllor.txtProductDesc.text,
                        size: "",
                        name: addDataControllor.txtProductName.text,
                        brand: addDataControllor.txtProductBrand.text,
                      );

                      await addDataControllor.AddData(
                        h1: home,
                      );
                    } else {
                      HomeModel home = HomeModel(
                        key: homeModel.key,
                        size: "20",
                        name: addDataControllor.txtProductName.text,
                        price: addDataControllor.txtProductPrice.text,
                        discount: addDataControllor.txtProductDiscount.text,
                        rate: addDataControllor.txtProductRate.text,
                        desc: addDataControllor.txtProductDesc.text,
                        brand: addDataControllor.txtProductBrand.text,
                      );
                      addDataControllor.updateData(
                        h1: home,
                      );
                    }

                    Get.back();
                  },
                  child: Text(
                    homeModel.checkUpdate == 0 ? "Submit" : "Update",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
