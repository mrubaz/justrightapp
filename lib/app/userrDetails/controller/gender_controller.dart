import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../services/adminbasecontroller.dart';
import '../view/age_screen.dart';

class GenderController extends GetxController {
  RxBool femaleColor = true.obs;
  RxBool maleColor = false.obs;
  String? gender;
  String? _userId;

  @override
  void onInit() {
    gender = AdminBaseController.userData.value.gender ?? "Male";
    _userId = FirebaseAuth.instance.currentUser!.uid;
    super.onInit();
  }

  gotoAge() {
    if (AdminBaseController.userData.value.userName != null) {
      getGenderDetail();
      Get.to(() => const AgeScreen());
      return;
    }
    Get.to(() => const AgeScreen());
  }

  back() {
    Get.back();
  }

  getGenderDetail() async {
    try {
      final db = FirebaseFirestore.instance.collection('users').doc(_userId);
      // log(db.id);
      var userOldDetail = AdminBaseController.userData.value;
      userOldDetail.gender = gender.toString();
      AdminBaseController().updateUser(userOldDetail);
      update();
      await db.update({
        "gender": "${AdminBaseController.userData.value.gender}"
      });
      update();
    } on FirebaseAuthException catch (e) {
      log("Firebase Error: $e");
    }
  }
}
