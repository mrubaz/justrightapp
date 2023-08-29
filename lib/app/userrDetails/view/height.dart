import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/adminbasecontroller.dart';
import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';
import '../controller/height_controller.dart';

class HeightScreen extends StatelessWidget {
  const HeightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HeightController());
    return GetBuilder<HeightController>(builder: (_) {
      return Scaffold(
        backgroundColor: AppColors.darkGreenColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 24,
                  left: 24,
                ),
                child: CustomWidget(
                  toBack: () {
                    controller.back();
                  },
                ),
              ),
              Column(children: [
                SizedBox(height: Get.height * 0.035),
                Text(
                  AppStrings.whatHeight.toUpperCase(),
                  style: StyleRefer.integralRegular.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: Get.height * 0.1),
                ListSlider(
                  initialValue:
                      AdminBaseController.userData.value.height ?? 133,
                  itemsList: controller.heightList,
                  smalltext: true,
                  barWidth: 0.29,
                  onSelectedItemChange: (val) {
                    controller.height = controller.heightList[val];
                    controller.update();
                  },
                ),
              ]),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
              left: Get.width * 0.15, right: Get.width * 0.15, bottom: 30),
          child: AppButton(
            title: "Next",
            minWidth: Get.width * 0.7,
            onTap: () {
              AdminBaseController.userData.value.height = controller.height;
              controller.gotoGoal();
            },
          ),
        ),
      );
    });
  }
}
