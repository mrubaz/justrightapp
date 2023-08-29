import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../utils/strings.dart';
import 'adminbasecontroller.dart';

class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

  //SIGN IN METHOD
  //**********************************************************
  Future signIn(String email, String password) async {
    //**********************************************************
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return Get.snackbar(e.code, e.message.toString());
    }
  }

  // upload data
  //**********************************************************
  Future<void> addUser() async {
    //**********************************************************
    var userData = AdminBaseController.userData.value;
    final String userID = userData.uid ?? '';
    DocumentReference users = FirebaseFirestore.instance.collection("users").doc(userID);
    return users.set({
      'uid': userID,
      'gender': userData.gender,
      'userName': userData.userName,
      'urlImage': userData.urlImage,
      'age': userData.age,
      'weight': userData.weight,
      'height': userData.height,
      'activity': userData.activityLevel,
      'goal': userData.goal,
    });
  }

  //User Existence check
  //**********************************************************
  Future<String> signUp(String email, String password) async {
    //**********************************************************
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user?.uid ?? '';
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Email Already Exist", e.message.toString());
      return AppStrings.exception;
    }
  }

  // verification
  //**********************************************************
  Future sendVerificationEmail() async {
    //**********************************************************
    try {
      await _auth.currentUser!.sendEmailVerification();
      Get.snackbar(AppStrings.verifyEmail, AppStrings.linkSent);
    } on FirebaseAuthException catch (e) {
      Get.snackbar(e.code, e.message.toString());
    }
  }

  //SIGN OUT METHOD
  //**********************************************************
  Future signOut() async {
    //**********************************************************
    await _auth.signOut();
  }

//  Facebook Login
  //**********************************************************
  Future<UserCredential?> signInWithFacebook() async {
    //**********************************************************

    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    return null;
  }

// Google signin

  //**********************************************************
  Future<UserCredential?> signInWithGoogle() async {
    //**********************************************************
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    if (googleAuth?.accessToken?.isEmpty ?? true) {
      return null;
    }
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
