import 'package:get/get.dart';

import '../controllers/detail_carbon_controller.dart';

class DetailCarbonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailCarbonController>(
      () => DetailCarbonController(),
    );
  }
}
