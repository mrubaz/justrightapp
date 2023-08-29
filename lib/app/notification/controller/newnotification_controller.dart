import 'package:get/get.dart';

import '../../../models/notification_model.dart';

class NewNotificationController extends GetxController {
  RxList items = [
    NotificationModel(title: "Congratulatios", date: "9 : 45 AM", desc: "35% your daily challenge completed", id: '1'),
    NotificationModel(title: "Attention", date: "9:38 AM", desc: "Your subscription is going to expire very soon. Subscribe now.", id: '2'),
    NotificationModel(title: "Daily Activity", date: "8:25 AM", desc: "Time for your workout session ", id: '3'),
    NotificationModel(title: "Activity", date: "8:25 AM", desc: "Your best your workout session ", id: '4'),
    NotificationModel(title: "Hello", date: "9 : 45 AM", desc: "35% your daily challenge completed", id: '1'),
    NotificationModel(title: "How are you?", date: "9:38 AM", desc: "Your subscription is going to expire very soon. Subscribe now.", id: '2'),
    NotificationModel(title: "What's up?", date: "8:25 AM", desc: "Time for your workout session ", id: '3'),
    NotificationModel(title: "Toady's Activity", date: "8:25 AM", desc: "Your best your workout session ", id: '4'),
    NotificationModel(title: "Congratulatios", date: "9 : 45 AM", desc: "35% your daily challenge completed", id: '1'),
    NotificationModel(title: "Attention", date: "9:38 AM", desc: "Your subscription is going to expire very soon. Subscribe now.", id: '2'),
    NotificationModel(title: "Daily Activity", date: "8:25 AM", desc: "Time for your workout session ", id: '3'),
    NotificationModel(title: "Activity", date: "8:25 AM", desc: "Your best your workout session ", id: '4'),
    NotificationModel(title: "Hello", date: "9 : 45 AM", desc: "35% your daily challenge completed", id: '1'),
    NotificationModel(title: "How are you?", date: "9:38 AM", desc: "Your subscription is going to expire very soon. Subscribe now.", id: '2'),
    NotificationModel(title: "What's up?", date: "8:25 AM", desc: "Time for your workout session ", id: '3'),
    NotificationModel(title: "Toady's Activity", date: "8:25 AM", desc: "Your best your workout session ", id: '4'),
  ].obs;
  Rx<bool> isSwipe = true.obs;

  deleteMessage(int index) {
    items.removeAt(index);
    update();
    Get.back();
  }

  back() {
    Get.back();
  }
}
