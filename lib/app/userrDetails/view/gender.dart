import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/adminbasecontroller.dart';
import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';
import '../controller/gender_controller.dart';

class GenderScreen extends StatelessWidget {
  const GenderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GenderController());
    return Scaffold(
      backgroundColor: AppColors.darkGreenColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              CustomWidget(
                toBack: () {
                  controller.back();
                },
              ),
              SizedBox(height: Get.height * 0.035),
              Text(
                AppStrings.tellUsAboutGender.toUpperCase(),
                style: StyleRefer.integralRegular.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                AppStrings.gender.toUpperCase(),
                style: StyleRefer.integralRegular.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: Get.height * 0.087),
              Obx(() => GenderWidget(
                  femaleColor: AdminBaseController.userData.value.gender != null
                      ? controller.maleColor.value
                      : controller.femaleColor.value,
                  icon: AssetRef.maleIcon,
                  title: AppStrings.male,
                  onTap: () {
                    controller.maleColor.value = true;
                    controller.femaleColor.value = false;
                    controller.update();
                  })),
              SizedBox(height: Get.height * 0.054),
              Obx(() => GenderWidget(
                    femaleColor:
                        AdminBaseController.userData.value.gender != null
                            ? controller.femaleColor.value
                            : controller.maleColor.value,
                    icon: AssetRef.femaleIcon,
                    title: AppStrings.female,
                    onTap: () {
                      controller.maleColor.value = false;
                      controller.femaleColor.value = true;
                      controller.update();
                    },
                  )),
              SizedBox(height: Get.height * (0.0527)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: Get.width * 0.15, right: Get.width * 0.15, bottom: 30),
        child: AppButton(
            title: "Next",
            minWidth: Get.width * 0.7,
            onTap: () {
              controller.maleColor.value == true
                  ? controller.gender = "Male"
                  : controller.gender = "Female";
              controller.update();
              AdminBaseController.userData.value.gender =
                  controller.gender.toString();
              controller.gotoAge();
            }),
      ),
    );
  }
}
