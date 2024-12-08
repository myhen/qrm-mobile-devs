import 'package:get/get.dart';

import '../controllers/holding_controller.dart';

class HoldingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HoldingController>(
      () => HoldingController(),
    );
  }
}
