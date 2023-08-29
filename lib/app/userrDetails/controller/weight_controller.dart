import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../services/adminbasecontroller.dart';
import '../view/height.dart';

class WeightController extends GetxController {
  int? weight;
  String? _userId;

  @override
  void onInit() {
    weight = AdminBaseController.userData.value.weight ?? 1;
    super.onInit();
  }

  back() {
    Get.back();
  }

  gotoHeight() {
    if (AdminBaseController.userData.value.userName != null) {
      getWeightDetail();
      Get.to(() => const HeightScreen());
      return;
    }
    Get.to(() => const HeightScreen());
  }

  getWeightDetail() async {
    try {
      final db = FirebaseFirestore.instance.collection('users').doc(_userId);
      var userOldDetail = AdminBaseController.userData.value;
      userOldDetail.weight = weight;
      AdminBaseController().updateUser(userOldDetail);
      update();
      await db.update({
        "weight": AdminBaseController.userData.value.weight
      });
      update();
    } on FirebaseAuthException catch (e) {
      log("Firebase Error: $e");
    }
  }
}
