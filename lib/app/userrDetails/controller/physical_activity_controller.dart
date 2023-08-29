import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../services/adminbasecontroller.dart';
import '../../login/view/login_screen.dart';
import '../view/getinto_screen.dart';

class PhysicalActivityController extends GetxController {
  String activity = "Beginner";
  String? _userId;

  @override
  void onInit() {
    activity = AdminBaseController.userData.value.activityLevel ?? "Beginner";
    super.onInit();
  }

  final List<String> activityLevelList = [
    'Beginner',
    'Intermediate',
    'Advance'
  ];

  back() {
    Get.back();
  }

  gotoNext() {
    if (AdminBaseController.userData.value.userName != null) {
      getWeightDetail();
      Get.to(() => GetIntoScreen());
      return;
    }
    Get.offAll(() => LoginScreen());
  }

  getWeightDetail() async {
    try {
      final db = FirebaseFirestore.instance.collection('users').doc(_userId);
      var userOldDetail = AdminBaseController.userData.value;
      userOldDetail.activityLevel = activity;
      AdminBaseController().updateUser(userOldDetail);
      update();
      await db.update({
        "activity": AdminBaseController.userData.value.activityLevel
      });
      update();
    } on FirebaseAuthException catch (e) {
      log("Firebase Error: $e");
    }
  }
}
