import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../services/adminbasecontroller.dart';
import '../view/physical_activity_screen.dart';

class GoalController extends GetxController {
  String? goals;
  String? _userId;

  @override
  void onInit() {
    goals = AdminBaseController.userData.value.goal ?? "Increase step count";
    super.onInit();
  }

  final List<String> goalsList = [
    'Lose Weight',
    'Maintain weight',
    'Gain Weight',
    'Gain Muscle',
    'Modify My Diet',
    'Manage Stress',
    'Increase step count'
  ];

  back() {
    Get.back();
  }

  gotoPhysical() {
    if (AdminBaseController.userData.value.userName != null) {
      getWeightDetail();
      Get.to(() => const PhysicalActivityScreen());
      return;
    }
    Get.to(() => const PhysicalActivityScreen());
  }

  getWeightDetail() async {
    try {
      final db = FirebaseFirestore.instance.collection('users').doc(_userId);
      var userOldDetail = AdminBaseController.userData.value;
      userOldDetail.goal = goals;
      AdminBaseController().updateUser(userOldDetail);
      update();
      await db.update({
        "goal": AdminBaseController.userData.value.goal
      });
      update();
    } on FirebaseAuthException catch (e) {
      log("Firebase Error: $e");
    }
  }
}
