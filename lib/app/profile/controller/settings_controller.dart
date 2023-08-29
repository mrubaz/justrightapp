import 'package:get/get.dart';

import '../view/notifications_settings.dart';

class SettingsController extends GetxController {
  gotoNotificationSettings() {
    Get.to(NotificationSettings());
  }

  back() {
    Get.back();
  }
}
