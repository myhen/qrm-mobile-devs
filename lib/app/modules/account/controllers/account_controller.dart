import 'package:get/get.dart';

class AccountController extends GetxController {
  RxDouble height = 250.0.obs;

  void adjustHeader(double value) {
    height.value = value;
  }
}
