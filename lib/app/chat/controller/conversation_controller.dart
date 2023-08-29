import 'package:get/get.dart';

import '../../../models/chat_model.dart';

class ConversationController extends GetxController {
  List<ChatModel> messages = [
    ChatModel(message: "Hello, Will", receiverId: "receiver"),
    ChatModel(message: "sounds great", receiverId: "receiver"),
    ChatModel(message: "feeling great, lighter and relax", senderId: "sender"),
    ChatModel(message: "Hi, how you are feeling?", receiverId: "receiver"),
    ChatModel(message: "Hi, just finishes the workout", senderId: "sender"),
  ];
  back() {
    Get.back();
  }
}
