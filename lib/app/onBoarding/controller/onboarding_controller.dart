import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../view/welcome_screen.dart';

class OnBoardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  List<OnBoardingInfo> onBoarding = [];
  bool get isLastPage => selectedPageIndex.value == onBoarding.length - 1;

  var pageController = PageController();
  forwardAction() {
    if (isLastPage) {
      gotoHome();
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  gotoHome() {
    Get.offAll(() => WelcomeScreen());
  }

  setOnBoardingData() {
    onBoarding.clear();
    onBoarding.add(OnBoardingInfo(
        title: AppStrings.meetCoach,
        description: AppStrings.dummyData,
        imageAsset: AssetRef.onBoarding1));
    onBoarding.add(OnBoardingInfo(
        title: AppStrings.createWorkout,
        description: AppStrings.dummyData,
        imageAsset: AssetRef.onBoarding2));
    onBoarding.add(OnBoardingInfo(
        title: AppStrings.stayMotivated,
        description: AppStrings.dummyData,
        imageAsset: AssetRef.onBoarding3));

    update();
  }

  @override
  void onInit() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    setOnBoardingData();
    super.onInit();
  }
}

class OnBoardingInfo {
  final String? imageAsset;
  final String? title;
  final String? description;

  OnBoardingInfo({this.imageAsset, this.title, this.description});
}
