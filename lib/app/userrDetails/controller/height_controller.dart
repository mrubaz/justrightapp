import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../services/adminbasecontroller.dart';
import '../view/goal.dart';

class HeightController extends GetxController {
  final List<int> heightList = List.generate(181, (i) => i + 120);
  int? height;
  String? _userId;

  @override
  void onInit() {
    height = AdminBaseController.userData.value.height ?? 133;
    super.onInit();
  }

  back() {
    Get.back();
  }

  gotoGoal() {
    if (AdminBaseController.userData.value.userName != null) {
      getWeightDetail();
      Get.to(() => const GoalScreen());
      return;
    }
    Get.to(() => const GoalScreen());
  }

  getWeightDetail() async {
    try {
      final db = FirebaseFirestore.instance.collection('users').doc(_userId);
      var userOldDetail = AdminBaseController.userData.value;
      userOldDetail.height = height;
      AdminBaseController().updateUser(userOldDetail);
      update();
      await db.update({
        "height": AdminBaseController.userData.value.height
      });
      update();
    } on FirebaseAuthException catch (e) {
      log("Firebase Error: $e");
    }
  }
}
