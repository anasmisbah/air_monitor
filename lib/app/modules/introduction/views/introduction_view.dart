import 'package:air_monitor/app/consntans/color.dart';
import 'package:air_monitor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_splash.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Selamat Datang di",
                      style: TextStyle(
                        fontSize: 28.w,
                        fontWeight: FontWeight.w600,
                        color: AppColor.surface2,
                        letterSpacing: 0.05,
                      ),
                    ),
                    Text(
                      "aplikasi monitoring kadar polusi udara berbasis Internet of Things yang terkoneksi dengan perangkat anda",
                      style: TextStyle(
                        fontSize: 14.w,
                        color: AppColor.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 66,
                ),
                Image.asset(
                  "assets/images/ilustration1.png",
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 50,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: Get.width,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      
                      Get.offNamed(Routes.HOME);
                    },
                    child: Text(
                      "Mulai",
                      style: TextStyle(
                        fontSize: 16.w,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.main,
                      padding: EdgeInsets.symmetric(vertical: 12.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
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
