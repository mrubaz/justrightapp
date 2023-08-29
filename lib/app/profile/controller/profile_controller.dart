import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../models/usermodel.dart';
import '../../../services/adminbasecontroller.dart';
import '../../login/view/login_screen.dart';
import '../../userrDetails/view/gender.dart';
import '../view/edit_profile.dart';
import '../view/privacy_policy.dart';
import '../view/settings.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? userName;

  @override
  void onInit() {
    userName = _auth.currentUser!.displayName;
    AdminBaseController.userData.value.userName =
        userName ?? AdminBaseController.userData.value.userName;
    super.onInit();
  }

  gotoEditProfile() {
    Get.to(() => const EditProfile());
  }

  gotoGenderScreen() {
    Get.to(() => const GenderScreen());
  }

  gotoSettings() {
    Get.to(() => const SettingsScreen());
  }

  gotoPrivacy() {
    Get.to(() => const PrivacyPolicy());
  }

  signOut() async {
    AdminBaseController().showProgress();
    await Future.delayed(const Duration(seconds: 1));
    AdminBaseController.userData.value = UserData();
    await FirebaseAuth.instance.signOut();
    AdminBaseController().hideProgress();
    Get.offAll(() => LoginScreen());
  }
}
