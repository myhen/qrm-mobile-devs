import 'package:get/get.dart';

class AppController extends GetxController {
  RxBool isLogged = false.obs;
  RxInt navIndex = 0.obs;

  List<int> visited = [0];

  void onNavigate(int index) {
    navIndex.value = index;

    // menandai jika halaman tertentu sudah pernah dibuka
    // hal ini berguna nanti saat kita menggunakan API request
    visited.addIf(!visited.contains(index), index);
  }
}

class AppState {
  static void setLogged([bool value = true]) {
    final app = Get.find<AppController>();
    app.isLogged.value = value;

    if (!value) {
      app.navIndex.value = 0;
      app.visited = [0];
    }
  }
}
