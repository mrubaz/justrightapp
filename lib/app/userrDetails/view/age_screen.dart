import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/adminbasecontroller.dart';
import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';
import '../controller/age_controller.dart';

class AgeScreen extends StatelessWidget {
  const AgeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AgeController());
    return GetBuilder<AgeController>(builder: (_) {
      return Scaffold(
        backgroundColor: AppColors.darkGreenColor,
        body: Padding(
          padding: const EdgeInsets.only(right: 24, left: 24, top: 20),
          child: Column(
            children: [
              CustomWidget(
                toBack: () {
                  controller.back();
                },
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: Get.height * 0.035),
                    Text(
                      AppStrings.howOldYOu.toUpperCase(),
                      style: StyleRefer.integralRegular.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.075),
                    ListSlider(
                        initialValue:
                            AdminBaseController.userData.value.age ?? 14,
                        itemsList: controller.agesList,
                        barWidth: 0.3,
                        onSelectedItemChange: (val) {
                          controller.val = controller.agesList[val];
                          controller.update();
                        }),
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
              AdminBaseController.userData.value.age = controller.val;
              controller.gotoWeight();
            },
          ),
        ),
      );
    });
  }
}
