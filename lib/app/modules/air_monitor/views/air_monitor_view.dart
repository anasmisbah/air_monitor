import 'package:air_monitor/app/consntans/color.dart';
import 'package:air_monitor/app/consntans/ui_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/air_monitor_controller.dart';

class AirMonitorView extends GetView<AirMonitorController> {
  const AirMonitorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monitor Udara'),
        centerTitle: true,
        backgroundColor: AppColor.main2,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => controller.getData(),
            icon: Icon(Icons.refresh),
          ),
        ],
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
                child: Obx(() {
                  switch (controller.uistate.value) {
                    case UIState.loading:
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColor.main2,
                        ),
                      );
                    case UIState.success:
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            // AQI
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 8.w,
                              ),
                              margin: const EdgeInsets.only(
                                bottom: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColor.surface2,
                                borderRadius: BorderRadius.circular(16.w),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 58.w,
                                    height: 58.w,
                                    padding: EdgeInsets.all(2.w),
                                    decoration: const BoxDecoration(
                                      color: AppColor.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(controller
                                            .airQualityIndexModel.value.image ??
                                        ""),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Kualitas Udara",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: AppColor.aqi_1,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Text(
                                            controller.airQualityIndexModel
                                                    .value.status ??
                                                "-",
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: AppColor.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "${(controller.airQualityIndexModel.value.aqi)}",
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.text,
                                        shadows: [
                                          Shadow(
                                              // bottomLeft
                                              offset: const Offset(-1.5, -1.5),
                                              color: AppColor.aqi_1
                                                  .withOpacity(0.2)),
                                          Shadow(
                                              // bottomRight
                                              offset: const Offset(1.5, -1.5),
                                              color: AppColor.aqi_1
                                                  .withOpacity(0.2)),
                                          Shadow(
                                              // topRight
                                              offset: const Offset(1.5, 1.5),
                                              color: AppColor.aqi_1
                                                  .withOpacity(0.2)),
                                          Shadow(
                                              // topLeft
                                              offset: const Offset(-1.5, 1.5),
                                              color: AppColor.aqi_1
                                                  .withOpacity(0.2)),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                            // CO
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 8.w,
                              ),
                              margin: const EdgeInsets.only(
                                bottom: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColor.surface2,
                                borderRadius: BorderRadius.circular(16.w),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 56.w,
                                    height: 56.w,
                                    padding: EdgeInsets.all(8.w),
                                    decoration: const BoxDecoration(
                                      color: AppColor.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset("assets/images/co.png"),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "CO",
                                      style: TextStyle(
                                        fontSize: 14.w,
                                        color: AppColor.text,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${controller.co.value} ppm",
                                    style: TextStyle(
                                      fontSize: 24.w,
                                      color: AppColor.text,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // CO2
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 8.w,
                              ),
                              margin: const EdgeInsets.only(
                                bottom: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColor.surface2,
                                borderRadius: BorderRadius.circular(16.w),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 56.w,
                                    height: 56.w,
                                    padding: EdgeInsets.all(8.w),
                                    decoration: const BoxDecoration(
                                      color: AppColor.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset("assets/images/co2.png"),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "CO2",
                                      style: TextStyle(
                                        fontSize: 14.w,
                                        color: AppColor.text,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${controller.co2.value} ppm",
                                    style: TextStyle(
                                      fontSize: 24.w,
                                      color: AppColor.text,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // NH3
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 8.w,
                              ),
                              margin: const EdgeInsets.only(
                                bottom: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColor.surface2,
                                borderRadius: BorderRadius.circular(16.w),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 56.w,
                                    height: 56.w,
                                    padding: EdgeInsets.all(8.w),
                                    decoration: const BoxDecoration(
                                      color: AppColor.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset("assets/images/nh3.png"),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "NH3",
                                      style: TextStyle(
                                        fontSize: 14.w,
                                        color: AppColor.text,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${controller.nh3.value}",
                                    style: TextStyle(
                                      fontSize: 24.w,
                                      color: AppColor.text,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // TEMP
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 8.w,
                              ),
                              margin: const EdgeInsets.only(
                                bottom: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColor.surface2,
                                borderRadius: BorderRadius.circular(16.w),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 56.w,
                                    height: 56.w,
                                    padding: EdgeInsets.all(8.w),
                                    decoration: const BoxDecoration(
                                      color: AppColor.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                        "assets/images/thermometer.png"),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Suhu",
                                      style: TextStyle(
                                        fontSize: 14.w,
                                        color: AppColor.text,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${controller.temp.value}\u00b0c",
                                    style: TextStyle(
                                      fontSize: 24.w,
                                      color: AppColor.text,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // HUM
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 8.w,
                              ),
                              margin: const EdgeInsets.only(
                                bottom: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColor.surface2,
                                borderRadius: BorderRadius.circular(16.w),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 56.w,
                                    height: 56.w,
                                    padding: EdgeInsets.all(8.w),
                                    decoration: const BoxDecoration(
                                      color: AppColor.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child:
                                        Image.asset("assets/images/humi.png"),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Kelembapan",
                                      style: TextStyle(
                                        fontSize: 14.w,
                                        color: AppColor.text,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${controller.hum.value}%",
                                    style: TextStyle(
                                      fontSize: 24.w,
                                      color: AppColor.text,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // Altitude
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 8.w,
                              ),
                              margin: const EdgeInsets.only(
                                bottom: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColor.surface2,
                                borderRadius: BorderRadius.circular(16.w),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 56.w,
                                    height: 56.w,
                                    padding: EdgeInsets.all(8.w),
                                    decoration: const BoxDecoration(
                                      color: AppColor.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                        "assets/images/altitude.png"),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Ketinggian",
                                      style: TextStyle(
                                        fontSize: 14.w,
                                        color: AppColor.text,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${controller.altitude.value}m",
                                    style: TextStyle(
                                      fontSize: 24.w,
                                      color: AppColor.text,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // Altitude
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 8.w,
                              ),
                              margin: const EdgeInsets.only(
                                bottom: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColor.surface2,
                                borderRadius: BorderRadius.circular(16.w),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 56.w,
                                    height: 56.w,
                                    padding: EdgeInsets.all(8.w),
                                    decoration: const BoxDecoration(
                                      color: AppColor.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                        "assets/images/pressure.png"),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Tekanan (hPa)",
                                      style: TextStyle(
                                        fontSize: 14.w,
                                        color: AppColor.text,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${controller.altitude.value}",
                                    style: TextStyle(
                                      fontSize: 24.w,
                                      color: AppColor.text,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Divider(
                              color: AppColor.main2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Pembaharuan Terakhir"),
                                Text(controller.lastUpdate.value),
                              ],
                            )
                          ],
                        ),
                      );
                    case UIState.error:
                      return Center(
                        child: Text(
                          "Terjadi Kesalahan, Silahkan refresh kembali",
                        ),
                      );
                    default:
                      return SizedBox();
                  }
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
