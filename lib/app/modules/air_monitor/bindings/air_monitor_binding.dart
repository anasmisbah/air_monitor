import 'package:get/get.dart';

import '../controllers/air_monitor_controller.dart';

class AirMonitorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AirMonitorController>(
      () => AirMonitorController(),
    );
  }
}
