import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';
import '../controller/wake_up_controller.dart';

class WakeUpCall extends StatelessWidget {
  WakeUpCall({Key? key}) : super(key: key);
  final _controller = Get.put(WakeUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGreenColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                CustomWidget(
                  title: AppStrings.wakeUpCall,
                  toBack: () {
                    _controller.back();
                  },
                ),
                const SizedBox(height: 36),
                Obx(() => GestureDetector(
                      onTap: () => _controller.gotoWorkout(),
                      child: ListTileWakeUpCall(
                        text: AppStrings.fullbodyW,
                        tileIcon: AssetRef.cyclingIcon,
                        subText: AppStrings.fullbodySub1,
                        onTapCheckBox: () {
                          if (_controller.isFullChecked.value == false) {
                            _controller.isFullChecked.value = true;
                          } else {
                            _controller.isFullChecked.value = false;
                          }
                          _controller.update();
                        },
                        isChecked: _controller.isFullChecked.value,
                      ),
                    )),
                const SizedBox(height: 20),
                Obx(() => GestureDetector(
                      onTap: () => _controller.gotoWorkout(),
                      child: ListTileWakeUpCall(
                          text: AppStrings.upperbodyW,
                          tileIcon: AssetRef.cyclingIcon,
                          subText: AppStrings.upperbodySub1,
                          onTapCheckBox: () {
                            if (_controller.isUpperChecked.value == false) {
                              _controller.isUpperChecked.value = true;
                            } else {
                              _controller.isUpperChecked.value = false;
                            }
                            _controller.update();
                          },
                          isChecked: _controller.isUpperChecked.value),
                    )),
                const SizedBox(height: 20),
                Obx(() => GestureDetector(
                      onTap: () => _controller.gotoWorkout(),
                      child: ListTileWakeUpCall(
                          text: AppStrings.lowerbodyW,
                          tileIcon: AssetRef.cyclingIcon,
                          subText: AppStrings.lowerbodySub1,
                          onTapCheckBox: () {
                            if (_controller.isLowerChecked.value == false) {
                              _controller.isLowerChecked.value = true;
                            } else {
                              _controller.isLowerChecked.value = false;
                            }
                            _controller.update();
                          },
                          isChecked: _controller.isLowerChecked.value),
                    )),
                const SizedBox(height: 20),
                Obx(() => GestureDetector(
                      onTap: () => _controller.gotoWorkout(),
                      child: ListTileWakeUpCall(
                          text: AppStrings.cardioW,
                          tileIcon: AssetRef.cyclingIcon,
                          subText: AppStrings.cardioSub1,
                          onTapCheckBox: () {
                            if (_controller.isCardioChecked.value == false) {
                              _controller.isCardioChecked.value = true;
                            } else {
                              _controller.isCardioChecked.value = false;
                            }
                            _controller.update();
                          },
                          isChecked: _controller.isCardioChecked.value),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
