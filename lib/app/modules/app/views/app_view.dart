import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qrm_mobile/app/modules/home/views/home_view.dart';
import 'package:qrm_mobile/app/modules/login/views/login_view.dart';

import '../controllers/app_controller.dart';

class AppView extends GetView<AppController> {
  const AppView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!controller.isLogged.value) {
        return const LoginView();
      }

      return const HomeView();
    });
  }
}
