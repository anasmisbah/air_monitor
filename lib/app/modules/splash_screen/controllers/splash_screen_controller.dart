import 'dart:developer';

import 'package:air_monitor/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  final String logo = "assets/images/logo.png";
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    log("disini");
    await Future.delayed(Duration(seconds: 3));
    Get.offNamed(Routes.INTRODUCTION);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
