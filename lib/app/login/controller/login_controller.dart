import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/adminbasecontroller.dart';
import '../../../services/auth.dart';
import '../../../utils/methods.dart';
import '../../homePage/view/skeletonview.dart';
import '../../signup/view/sign_up.dart';
import '../view/forget_password_screen.dart';
import '../view/login_screen.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isVerified = true;
  Rx<bool> isLoading = false.obs;
  gotoForgetPass() {
    Get.to(() => const ForgetPasswordScreen());
  }

  gotoSignup() {
    Get.offAll(() => SignUpScreen());
  }

  gotoHomePage() {
    Get.offAll(() => const SkeletonView());
  }

  loginfirebase(
      String email, String password, GlobalKey<FormState> formkey) async {
    if (formkey.currentState!.validate()) {
      AdminBaseController().showProgress();
      await AuthenticationHelper().signIn(email, password).then((result) async {
        if (result == null) {
          isVerified = _auth.currentUser!.emailVerified;
          if (isVerified == false) {
            AdminBaseController().hideProgress();
            await okAlertDialogMethod();
            return Get.to(() => LoginScreen());
          }
          AdminBaseController.userData.value.uid = _auth.currentUser?.uid;
          AdminBaseController().hideProgress();
          gotoHomePage();
          await getUserData();
        } else {
          AdminBaseController().hideProgress();
          return null;
        }
      }).catchError((onError) {
        AdminBaseController().hideProgress();
        return null;
      });
    }
  }

  Future<dynamic> okAlertDialogMethod() {
    AdminBaseController().hideProgress();
    return showOkAlertDialog(
        context: Get.context!,
        message: "Please Verify your Email, Than you can login");
  }

// LoginGoogle
  loginWithGoogle() async {
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
          await getUserData();
          gotoHomePage();
        } else {
          AdminBaseController().hideProgress();
          gotoSignup();
          return Get.snackbar("Account doesn't exist",
              "Your account does not exists. Please Signup.");
        }
      }
    } on Exception catch (_) {
      AdminBaseController().hideProgress();
      return Get.snackbar("Error", "Sign In Failed");
    }
  }

  loginWithFacebook() async {
    try {
      AdminBaseController().showProgress();
      var result = await AuthenticationHelper().signInWithFacebook();
      if (result != null) {
        AdminBaseController().hideProgress();
        AdminBaseController.userData.value.uid = result.user?.uid;
        var userExist = await FirebaseFirestore.instance
            .collection("users")
            .doc(result.user!.uid)
            .get();
        if (userExist.exists) {
          await getUserData();
          AdminBaseController().hideProgress();
          return gotoHomePage();
        } else {
          AdminBaseController().hideProgress();
          Get.snackbar("Account doesn't exist",
              "Your account does not exists. Please Signup.");
          return gotoSignup();
        }
      }
    } on Exception catch (e) {
      AdminBaseController().hideProgress();
      return Get.snackbar(e.toString(), "Sign In Failed");
    }
  }
}
