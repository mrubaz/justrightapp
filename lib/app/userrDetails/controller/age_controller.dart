import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../services/adminbasecontroller.dart';
import '../view/weight.dart';

class AgeController extends GetxController {
  final List<int> agesList = List<int>.generate(120, (i) => i + 1);
  int? val;
  String? _userId;

  @override
  void onInit() {
    val = AdminBaseController.userData.value.age ?? 14;
    super.onInit();
  }

  back() {
    Get.back();
  }

  gotoWeight() {
    if (AdminBaseController.userData.value.userName != null) {
      getAgeDetail();
      Get.to(() => const WeightScreen());
      return;
    }
    Get.to(() => const WeightScreen());
  }

  getAgeDetail() async {
    try {
      final db = FirebaseFirestore.instance.collection('users').doc(_userId);
      var userOldDetail = AdminBaseController.userData.value;
      userOldDetail.age = val;
      AdminBaseController().updateUser(userOldDetail);
      update();
      await db.update({"age": AdminBaseController.userData.value.age});
      update();
    } on FirebaseAuthException catch (e) {
      log("Firebase Error: $e");
    }
  }
}
