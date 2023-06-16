import 'package:air_monitor/app/consntans/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
        centerTitle: true,
        backgroundColor: AppColor.main2,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(4.w),
            width: Get.width,
            decoration: BoxDecoration(
              color: AppColor.main2,
            ),
          ),
          Expanded(
            child: Container(
              color: AppColor.main2,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset("assets/images/logo.png"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\u2981 Versi : 1.0.0",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColor.text,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "\u2981 Build : 1.0.0",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColor.text,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: AppColor.main3,
                    ),
                    Text(
                      "aplikasi monitoring kadar polusi udara berbasis Internet of Things yang terkoneksi dengan perangkat anda (NB: Bisa diedit atau ditambahkan lagi nanti)",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.w,
                        color: AppColor.text,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
