import 'package:fire_app/Screen/AddDetail/Controllor/AddDetailControllor.dart';
import 'package:fire_app/Screen/AddDetail/Model/AddDtailModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddDetailScreen extends StatefulWidget {
  const AddDetailScreen({super.key});

  @override
  State<AddDetailScreen> createState() => _AddDetailScreenState();
}

class _AddDetailScreenState extends State<AddDetailScreen> {
  AddDetailControllor addDetailControllor = Get.put(
    AddDetailControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffD61355),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter Your First Name",
              ),
              SizedBox(height: 5.sp),
              TextField(
                controller: addDetailControllor.txtfname,
                decoration: InputDecoration(
                  hintText: "Ex. abcd",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10.sp),
              Text(
                "Enter Your Last Name",
              ),
              SizedBox(height: 5.sp),
              TextField(
                controller: addDetailControllor.txtlname,
                decoration: InputDecoration(
                  hintText: "Ex. abcd",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10.sp),
              Text(
                "Enter Your Mobile No",
              ),
              SizedBox(height: 5.sp),
              TextField(
                controller: addDetailControllor.txtmobileno,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Ex. 9988776655",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10.sp),
              Text(
                "Enter Your Address",
              ),
              SizedBox(height: 5.sp),
              TextField(
                controller: addDetailControllor.txtAddress,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Ex. building no,area city state pincode",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20.sp),
              Center(
                child: InkWell(
                  onTap: () async {
                    // AddDetailModel a1 = AddDetailModel(
                    //   address: addDetailControllor.txtAddress.text,
                    //   f_name: addDetailControllor.txtfname.text,
                    //   l_name: addDetailControllor.txtlname.text,
                    //   mobile_no: addDetailControllor.txtmobileno.text,
                    // );

                    String msg = await addDetailControllor.insertUserDetail(
                      f_name: addDetailControllor.txtfname.text,
                      l_name: addDetailControllor.txtfname.text,
                      mobile_no: addDetailControllor.txtfname.text,
                      address: addDetailControllor.txtfname.text,
                    );

                    Get.snackbar("$msg", "",);
                    if (msg == "success") {
                      Get.offAndToNamed('/bottom');
                    }
                  },
                  child: Container(
                    height: 30.sp,
                    width: 80.sp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffFA030B),
                          Color(0xffD9114E),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
