import 'package:get/get.dart';
import 'package:qrm_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:qrm_mobile/app/modules/login/controllers/login_controller.dart';

import '../../account/controllers/account_controller.dart';
import '../controllers/app_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppController>(
      () => AppController(),
    );

    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AccountController>(() => AccountController());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
