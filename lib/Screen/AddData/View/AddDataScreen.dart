import 'package:fire_app/Screen/AddData/Controllor/AddDataControllor.dart';
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
                    await addDataControllor.AddData(
                      name: addDataControllor.txtProductName.text,
                      price: addDataControllor.txtProductPrice.text,
                      discount: addDataControllor.txtProductDiscount.text,
                      rate: addDataControllor.txtProductRate.text,
                      desc: addDataControllor.txtProductDesc.text,
                      brand: addDataControllor.txtProductBrand.text,
                    );

                    Get.back();
                  },
                  child: Text(
                    "Submit",
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
