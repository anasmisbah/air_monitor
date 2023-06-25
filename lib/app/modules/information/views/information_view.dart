import 'package:air_monitor/app/consntans/air_quality_index.dart';
import 'package:air_monitor/app/consntans/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/information_controller.dart';

class InformationView extends GetView<InformationController> {
  const InformationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keterangan Kualitas Udara'),
        centerTitle: true,
        backgroundColor: AppColor.main2,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(4.w),
            width: Get.width,
            decoration: const BoxDecoration(
              color: AppColor.main2,
            ),
          ),
          Expanded(
            child: Container(
              color: AppColor.main2,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
                decoration: const BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: airQualityIndexData
                        .map(
                          (airQualityIndex) => Container(
                            padding: EdgeInsets.all(10.w),
                            margin: const EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.w),
                              color: AppColor.surface2,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 80.w,
                                  height: 80.w,
                                  padding: EdgeInsets.all(8.w),
                                  decoration: const BoxDecoration(
                                    color: AppColor.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(airQualityIndex.image??'https://coffective.com/wp-content/uploads/2018/06/default-featured-image.png.jpg'),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          color: airQualityIndex.color,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          "${airQualityIndex.status} ( ${airQualityIndex.value})",
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: AppColor.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "${airQualityIndex.desc}",
                                        style: TextStyle(
                                          fontSize: 11.w,
                                          color: AppColor.text,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
