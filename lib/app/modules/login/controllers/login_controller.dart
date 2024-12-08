import 'package:get/get.dart';
import 'package:lazyui/lazyui.dart';
import 'package:qrm_mobile/app/modules/app/controllers/app_controller.dart';

class LoginController extends GetxController {
  Future onLogin() async {
    try {
      await LzToast.overlay('Authenticating...', duration: 2.s);
      AppState.setLogged(true);
    } catch (e, s) {
      Errors.check(e, s);
    }
  }
}
