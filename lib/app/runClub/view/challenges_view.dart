import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';
import '../controller/challenges_controller.dart';

class ChallengesScreen extends StatelessWidget {
  ChallengesScreen({Key? key}) : super(key: key);
  final _controller = Get.put(ChallengesController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 28),
            Obx(() => ListTileChallengesTab(
                text: AppStrings.cycling,
                subText: '${AppStrings.completedAtDate}05/16/2022',
                tileIcon: AssetRef.cyclingIcon,
                isChecked: _controller.isCyclingChecked.value,
                onTapCheckBox: () {
                  if (_controller.isCyclingChecked.value == false) {
                    _controller.isCyclingChecked.value = true;
                  } else {
                    _controller.isCyclingChecked.value = false;
                  }

                  _controller.update();
                })),
            const SizedBox(height: 12),
            Obx(() => ListTileChallengesTab(
                text: AppStrings.yoga,
                tileIcon: AssetRef.yogaIcon,
                subText: AppStrings.minimumfor10mins,
                isChecked: _controller.isYogaChecked.value,
                onTapCheckBox: () {
                  if (_controller.isYogaChecked.value == false) {
                    _controller.isYogaChecked.value = true;
                  } else {
                    _controller.isYogaChecked.value = false;
                  }

                  _controller.update();
                })),
            const SizedBox(height: 12),
            Obx(() => ListTileChallengesTab(
                text: AppStrings.muscleMaker,
                tileIcon: AssetRef.muscleMakerIcon,
                subText: AppStrings.minimumfor10mins,
                isChecked: _controller.isMusleMakerChecked.value,
                onTapCheckBox: () {
                  if (_controller.isMusleMakerChecked.value == false) {
                    _controller.isMusleMakerChecked.value = true;
                  } else {
                    _controller.isMusleMakerChecked.value = false;
                  }

                  _controller.update();
                })),
            const SizedBox(height: 12),
            Obx(() => ListTileChallengesTab(
                text: AppStrings.skipping,
                tileIcon: AssetRef.skippingIcon,
                subText: AppStrings.minimumfor10mins,
                isChecked: _controller.isSkippingChecked.value,
                onTapCheckBox: () {
                  if (_controller.isSkippingChecked.value == false) {
                    _controller.isSkippingChecked.value = true;
                  } else {
                    _controller.isSkippingChecked.value = false;
                  }

                  _controller.update();
                })),
            const SizedBox(height: 12),
            Obx(() => ListTileChallengesTab(
                text: AppStrings.dumble,
                tileIcon: AssetRef.dumbleIcon,
                subText: AppStrings.minimumfor10mins,
                isChecked: _controller.isDumbleChecked.value,
                onTapCheckBox: () {
                  if (_controller.isDumbleChecked.value == false) {
                    _controller.isDumbleChecked.value = true;
                  } else {
                    _controller.isDumbleChecked.value = false;
                  }

                  _controller.update();
                }))
          ],
        ),
      ),
    );
  }
}
