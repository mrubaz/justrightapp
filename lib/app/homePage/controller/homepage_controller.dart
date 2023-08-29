import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../chat/view/chat.dart';
import '../../fitBody/fit_body.dart';
import '../../fitMind/fit_mind.dart';
import '../../runClub/view/run_club.dart';
import '../view/home_screen.dart';

class HomepageController extends GetxController {
  int selectedIndex = 0;
  Rx<bool> isLoading = false.obs;

  onTap({required int value}) {
    selectedIndex = value;
    update();
  }

  Widget screens() {
    switch (selectedIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const RunClubScreen();
      case 2:
        return FitBodyScreen();
      case 3:
        return FitMind();
      case 4:
        return ChatPage();
      default:
        return const HomeScreen();
    }
  }
}
