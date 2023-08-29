import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/methods.dart';
import '../../homePage/home_page.dart';
import '../../signup/view/sign_up.dart';
import '../view/on_boarding.dart';

class SplashScreenController extends GetxController {
  int num = 0;

  @override
  void onInit() {
    super.onInit();
    stream();
  }

  stream() {
    Future.delayed(const Duration(seconds: 2), () async {
      if (FirebaseAuth.instance.currentUser == null) {
        Get.offAll(() => OnBoardingScreen());
        return;
      }
      var userExist = await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      if (userExist.exists && FirebaseAuth.instance.currentUser != null) {
        await getUserData();
        await getWorkouts();
        Get.offAll(() => const HomePage());
      } else if (prefs.getInt("initScreen") == 1) {
        await FirebaseAuth.instance.signOut();
        Get.snackbar("Account Logged Out", "Please log in to continue");
        Get.offAll(() => SignUpScreen());
      } else {
        Get.offAll(OnBoardingScreen());
      }
    });
  }
}
