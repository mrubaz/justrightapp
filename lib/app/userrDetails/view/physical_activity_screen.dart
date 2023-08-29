import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/adminbasecontroller.dart';
import '../../../services/auth.dart';
import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';
import '../controller/physical_activity_controller.dart';

class PhysicalActivityScreen extends StatelessWidget {
  const PhysicalActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PhysicalActivityController());
    return GetBuilder<PhysicalActivityController>(builder: (_) {
      return Scaffold(
        backgroundColor: AppColors.darkGreenColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(children: [
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
            SizedBox(height: Get.height * 0.035),
            Text(
              AppStrings.physical.toUpperCase(),
              style: StyleRefer.integralRegular.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              AppStrings.activityLevel.toUpperCase(),
              style: StyleRefer.integralRegular.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: Get.height * 0.1,
            ),
            ListSlider(
              initialValue: AdminBaseController.userData.value.activityLevel ??
                  "Beginner",
              itemsList: controller.activityLevelList,
              fontsize: 24,
              barWidth: 0.17,
              onSelectedItemChange: (val) {
                controller.activity = controller.activityLevelList[val];
                controller.update();
              },
            ),
          ]),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
              left: Get.width * 0.15, right: Get.width * 0.15, bottom: 30),
          child: AppButton(
            title: "Next",
            minWidth: Get.width * 0.7,
            onTap: () async {
              AdminBaseController.userData.value.activityLevel =
                  controller.activity;
              await AuthenticationHelper().addUser();
              controller.gotoNext();
            },
          ),
        ),
      );
    });
  }
}
