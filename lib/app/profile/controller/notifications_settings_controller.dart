import 'package:get/get.dart';

class NotificationsController extends GetxController {
  RxBool isWReminder = true.obs;
  RxBool isdailyNotifi = false.obs;
  back() {
    Get.back();
  }
}
