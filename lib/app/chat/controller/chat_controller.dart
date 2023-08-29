import 'package:get/get.dart';

import '../view/conversation.dart';

class ChatController extends GetxController {
  gotoConversationPage() {
    Get.to(ConversationPage());
  }
}
