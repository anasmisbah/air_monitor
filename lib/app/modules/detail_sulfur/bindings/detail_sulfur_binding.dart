import 'package:get/get.dart';

import '../controllers/detail_sulfur_controller.dart';

class DetailSulfurBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailSulfurController>(
      () => DetailSulfurController(),
    );
  }
}
