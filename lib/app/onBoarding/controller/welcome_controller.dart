import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../login/view/login_screen.dart';
import '../../signup/view/sign_up.dart';

class WelcomeScreenController extends GetxController {
  @override
  void onInit() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.onInit();
  }

  onClickSignUp() {
    Get.to(() => SignUpScreen());
  }

  gotoLogin() {
    Get.to(() => LoginScreen());
  }
}
