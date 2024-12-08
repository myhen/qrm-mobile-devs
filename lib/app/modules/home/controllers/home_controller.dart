import 'package:get/get.dart';
import 'package:lazyui/lazyui.dart';

class HomeController extends GetxController {
  RxDouble backgroundHeight = 200.0.obs;
  RxInt tabIndex = 0.obs;

  void onScroll(Scroller scroll) {
    double pixel = scroll.pixels;

    if (pixel < 0) {
      backgroundHeight.value = 200 + pixel.abs();
    } else {
      backgroundHeight.value = (200 - pixel.abs()).clamp(0, 200);
    }
  }
}
