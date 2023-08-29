import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/adminbasecontroller.dart';
import '../../../services/auth.dart';
import '../../../utils/strings.dart';
import '../../login/view/login_screen.dart';
import '../../userrDetails/view/gender.dart';

class SignupController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();
  Rx<bool> isgotoNext = false.obs;
  bool isVerified = true;

  @override
  void onInit() {
    AdminBaseController userData = AdminBaseController();
    super.onInit();
  }

  gotoGender() {
    Get.to(() => const GenderScreen());
  }

  gotoLogin() {
    Get.offAll(() => LoginScreen());
  }

  signUpwithFirebase(String email, String password, String userName,
      GlobalKey<FormState> formkey) async {
    if (formkey.currentState!.validate()) {
      AdminBaseController().showProgress();
      await alertDialogMethod().then((result) async {
        if (result == OkCancelResult.ok) {
          await AuthenticationHelper()
              .signUp(email, password)
              .then((result) async {
            if (result != AppStrings.exception) {
              AdminBaseController().hideProgress();
              isVerified = _auth.currentUser!.emailVerified;
              if (isVerified == false) {
                AdminBaseController().hideProgress();
                AuthenticationHelper().sendVerificationEmail();
                AdminBaseController.userData.value.uid =
                    _auth.currentUser?.uid ?? '';
                AdminBaseController.userData.value.userName =
                    userName.toString();
                await Future.delayed(const Duration(seconds: 1));
                return gotoGender();
              }
            }
          });
        } else {
          await Future.delayed(const Duration(seconds: 1));
          AdminBaseController().hideProgress();
          gotoLogin();
        }
      }).catchError((onError) async {
        await Future.delayed(const Duration(seconds: 1));
        AdminBaseController().hideProgress();
        return null;
      });
    }
  }

  Future<dynamic> alertDialogMethod() {
    AdminBaseController().hideProgress();
    return showOkCancelAlertDialog(
      context: Get.context!,
      title: "Title",
      message: "Can you add your details?",
    );
  }

  signUpWithGoogleSign() async {
    try {
      var result = await AuthenticationHelper().signInWithGoogle();
      if (result != null) {
        AdminBaseController().showProgress();
        AdminBaseController.userData.value.uid = result.user?.uid;
        var userExist = await FirebaseFirestore.instance
            .collection("users")
            .doc(result.user!.uid)
            .get();
        if (userExist.exists) {
          AdminBaseController().hideProgress();
          Get.snackbar("Account already exists",
              "Your account already exists. Please log in.");
          return gotoLogin();
        } else {
          AdminBaseController().hideProgress();
          return gotoGender();
        }
      }
    } on Exception catch (_) {
      AdminBaseController().hideProgress();
      return Get.snackbar("Error", "Sign In Failed");
    }
  }

  signUpFacebook() async {
    AdminBaseController().showProgress();
    try {
      AdminBaseController().hideProgress();
      var thisResult = await AuthenticationHelper().signInWithFacebook();
      if (thisResult != null) {
        AdminBaseController().hideProgress();
        AdminBaseController.userData.value.uid = thisResult.user!.uid;
        var userExist = await FirebaseFirestore.instance
            .collection("users")
            .doc(thisResult.user!.uid)
            .get();
        if (userExist.exists) {
          AdminBaseController().hideProgress();
          Get.snackbar("Account already exists",
              "Your account already exists. Please log in.");
          return gotoLogin();
        } else {
          AdminBaseController().hideProgress();
          return gotoGender();
        }
      }
    } on Exception catch (e) {
      AdminBaseController().hideProgress();
      return Get.snackbar("Error", e.toString());
    }
  }
}
