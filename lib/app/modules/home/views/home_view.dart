import 'package:air_monitor/app/consntans/color.dart';
import 'package:air_monitor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColor.main2,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 5,
                    child: Image.asset("assets/images/left_cloud.png"),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Image.asset("assets/images/right_cloud.png"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Selamat Pagi",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: AppColor.white,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: AppColor.surface2,
                            borderRadius: BorderRadius.circular(28.w),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.network(
                                      "https://openweathermap.org/img/wn/04d@2x.png"),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "May 16, 2023",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          "Cloudy",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.w,
                                          ),
                                        ),
                                        Text(
                                          "Jakarta, Indonesia",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "19\u00b0c",
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: AppColor.main2,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColor.white.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Image.asset(
                                              "assets/images/humidity_icon.png",
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            Text(
                                              "97",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18.w,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text(
                                              "%",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12.w,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "Humidity",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColor.white.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Image.asset(
                                              "assets/images/visibility_icon.png",
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            Text(
                                              "7",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18.w,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text(
                                              "km",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12.w,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "Visibility",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColor.white.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Image.asset(
                                              "assets/images/wind_icon.png",
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            Text(
                                              "3",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18.w,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text(
                                              "km/h",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12.w,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "Wind",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Image.asset("assets/images/sun.png"),
                  ),
                ],
              ),
            ),
            Container(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Monitor Udara",
                      style: TextStyle(
                        fontSize: 18.w,
                        fontWeight: FontWeight.w600,
                        color: AppColor.text,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Column(
                      children: [
                        // CO
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.surface2,
                            borderRadius: BorderRadius.circular(16.w),
                          ),
                          child: Material(
                            borderRadius: BorderRadius.circular(16.w),
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_CARBON);
                              },
                              borderRadius: BorderRadius.circular(16.w),
                              child: Container(
                                padding: EdgeInsets.all(16.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.w),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 56.w,
                                      height: 56.w,
                                      padding: EdgeInsets.all(8.w),
                                      decoration: BoxDecoration(
                                        color: AppColor.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child:
                                          Image.asset("assets/images/co.png"),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Carbon Monoksida (CO)",
                                        style: TextStyle(
                                          fontSize: 16.w,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.text,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // SO2
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.surface2,
                            borderRadius: BorderRadius.circular(16.w),
                          ),
                          child: Material(
                            borderRadius: BorderRadius.circular(16.w),
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_SULFUR);
                              },
                              borderRadius: BorderRadius.circular(16.w),
                              child: Container(
                                padding: EdgeInsets.all(16.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.w),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 56.w,
                                      height: 56.w,
                                      padding: EdgeInsets.all(8.w),
                                      decoration: BoxDecoration(
                                        color: AppColor.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child:
                                          Image.asset("assets/images/so2.png"),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Sulfur Dioksida (SO2)",
                                        style: TextStyle(
                                          fontSize: 16.w,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.text,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // TEMP
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.surface2,
                            borderRadius: BorderRadius.circular(16.w),
                          ),
                          child: Material(
                            borderRadius: BorderRadius.circular(16.w),
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_TEMPERATURE);
                              },
                              borderRadius: BorderRadius.circular(16.w),
                              child: Container(
                                padding: EdgeInsets.all(16.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.w),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 56.w,
                                      height: 56.w,
                                      padding: EdgeInsets.all(8.w),
                                      decoration: BoxDecoration(
                                        color: AppColor.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child:
                                          Image.asset("assets/images/temp.png"),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Suhu & Kelembapan",
                                        style: TextStyle(
                                          fontSize: 16.w,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.text,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Information & about
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.w),
                                  color: AppColor.surface2,
                                ),
                                child: Material(
                                  borderRadius: BorderRadius.circular(16.w),
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(16.w),
                                    onTap: () {
                                      Get.toNamed(Routes.ABOUT);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10.w),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 40.w,
                                            height: 40.w,
                                            padding: EdgeInsets.all(8.w),
                                            decoration: BoxDecoration(
                                              color: AppColor.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                                "assets/images/about.png"),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "Tentang",
                                              style: TextStyle(
                                                fontSize: 14.w,
                                                fontWeight: FontWeight.w600,
                                                color: AppColor.text,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.w),
                                  color: AppColor.surface2,
                                ),
                                child: Material(
                                  borderRadius: BorderRadius.circular(16.w),
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(16.w),
                                    onTap: () {
                                      Get.toNamed(Routes.INFORMATION);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10.w),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 40.w,
                                            height: 40.w,
                                            padding: EdgeInsets.all(8.w),
                                            decoration: BoxDecoration(
                                              color: AppColor.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                                "assets/images/information.png"),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "Keterangan",
                                              style: TextStyle(
                                                fontSize: 14.w,
                                                fontWeight: FontWeight.w600,
                                                color: AppColor.text,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
