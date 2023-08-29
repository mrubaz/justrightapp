import 'package:get/get.dart';

import '../view/stay_hydrated_confirm.dart';

class StayHydratedController extends GetxController {
  RxDouble total = 2280.0.obs;
  RxDouble givenTarget = 880.0.obs;
  RxDouble percent = 0.0.obs;

  double getProgressBarPercentage() {
    percent = (givenTarget.value / total.value).obs;
    return percent.toDouble();
  }

  void goToConfirmScreen() {
    Get.to(() => StayHydratedConfirmationScreen());
  }

  back() {
    Get.back();
  }
}
