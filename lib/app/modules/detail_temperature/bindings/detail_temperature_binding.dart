import 'package:get/get.dart';

import '../controllers/detail_temperature_controller.dart';

class DetailTemperatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailTemperatureController>(
      () => DetailTemperatureController(),
    );
  }
}
