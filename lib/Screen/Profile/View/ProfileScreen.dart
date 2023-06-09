import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_app/Screen/Profile/Controllor/ProfileControllor.dart';
import 'package:fire_app/Screen/Profile/Model/ProfileModel.dart';
import 'package:fire_app/Utiles/FireHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  ProfileControllor profileControllor = Get.put(
    ProfileControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: FireHelper.fireHelper.readUserDetail(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              DocumentSnapshot? data = snapshot.data;
              Map x = data!.data() as Map;

              ProfileModel profileModel = ProfileModel(
                l_name: x['l_name'],
                name: x['f_name'],
                email: x['email_id'],
                moile_no: x['mobile_no'],
                address: x['address'],
                image: x['address'],
              );

              profileControllor.profileModel = profileModel;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.sp),
                  Center(
                    child: InkWell(
                      onTap: () async {
                        ImagePicker imagePiker = ImagePicker();
                        XFile? xFile = await imagePiker.pickImage(
                          source: ImageSource.gallery,
                        );

                        setState(() {
                          profileControllor.image = xFile!.path;
                        });
                      },
                      child: CircleAvatar(
                        radius: 50.sp,
                        backgroundImage: FileImage(File("${profileControllor.image}"),),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 40.sp,
                        width: 80.sp,
                        alignment: Alignment.center,
                        child: Text(
                          "Name",
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                      Container(
                        height: 40.sp,
                        width: 80.sp,
                        alignment: Alignment.center,
                        child: Text(
                          "${profileControllor.profileModel.name}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Container(
                  //       height: 30.sp,
                  //       width: 50.sp,
                  //       alignment: Alignment.center,
                  //       child: Text("Name"),
                  //     ),
                  //     Container(
                  //       height: 30.sp,
                  //       width: 50.sp,
                  //       alignment: Alignment.center,
                  //       child: Text("Name"),
                  //     ),
                  //   ],
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Container(
                  //       height: 30.sp,
                  //       width: 50.sp,
                  //       alignment: Alignment.center,
                  //       child: Text("Name"),
                  //     ),
                  //     Container(
                  //       height: 30.sp,
                  //       width: 50.sp,
                  //       alignment: Alignment.center,
                  //       child: Text("Name"),
                  //     ),
                  //   ],
                  // ),
                ],
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
