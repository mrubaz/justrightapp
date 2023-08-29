import 'package:get/get.dart';

import '../view/workout_screen.dart';

class WakeUpController extends GetxController {
  RxBool isFullChecked = true.obs;
  RxBool isUpperChecked = false.obs;
  RxBool isLowerChecked = false.obs;
  RxBool isCardioChecked = false.obs;

  gotoWorkout() {
    Get.to(WorkoutScreen());
  }

  back() {
    Get.back();
  }
}
