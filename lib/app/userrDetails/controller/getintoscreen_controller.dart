import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../homePage/home_page.dart';

class GetIntoScreenController extends GetxController {
  @override
  void onInit() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.onInit();
  }

  getInApp() {
    Get.to(() => const HomePage());
  }
}
