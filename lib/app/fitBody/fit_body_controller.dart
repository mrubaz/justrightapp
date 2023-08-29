import 'dart:developer';

import 'package:get/get.dart';

class FitBodyController extends GetxController {
  @override
  void onInit() {
    log("onInit");
    // getExercises();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    Get.delete<FitBodyController>();
  }
}
