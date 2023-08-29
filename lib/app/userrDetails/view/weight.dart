import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheel_slider/wheel_slider.dart';

import '../../../services/adminbasecontroller.dart';
import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';
import '../controller/weight_controller.dart';

class WeightScreen extends StatelessWidget {
  const WeightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WeightController());
    return GetBuilder<WeightController>(builder: (_) {
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
              AppStrings.whatWeight.toUpperCase(),
              style: StyleRefer.integralRegular.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: Get.height * 0.2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  controller.weight.toString(),
                  style: StyleRefer.openSansSemiBold
                      .copyWith(fontSize: 64, fontWeight: FontWeight.w600),
                ),
                Text(
                  'kg',
                  style: StyleRefer.openSansRegular
                      .copyWith(fontSize: 17, fontWeight: FontWeight.w600),
                )
              ],
            ),
            WheelSlider(
              totalCount: 400,
              horizontalListHeight: 120,
              isVibrate: true,
              isInfinite: false,
              initValue: AdminBaseController.userData.value.weight ?? 1,
              lineColor: AppColors.greenColor,
              onValueChanged: (index) {
                controller.weight = index;
                controller.update();
              },
              pointerColor: AppColors.greenColor,
              pointerHeight: 92,
            ),
          ]),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
              left: Get.width * 0.15, right: Get.width * 0.15, bottom: 30),
          child: AppButton(
            title: "Next",
            minWidth: Get.width * 0.7,
            onTap: () {
              AdminBaseController.userData.value.weight = controller.weight;
              controller.gotoHeight();
            },
          ),
        ),
      );
    });
  }

  int getHeight({required int index}) {
    if (index == 0 ||
        index == 9 ||
        index == 19 ||
        index == 29 ||
        index == 39 ||
        index == 49 ||
        index == 59 ||
        index == 69 ||
        index == 79 ||
        index == 89 ||
        index == 99 ||
        index == 109 ||
        index == 119 ||
        index == 129 ||
        index == 139 ||
        index == 149 ||
        index == 159 ||
        index == 169 ||
        index == 179 ||
        index == 189 ||
        index == 199) return 2;
    return 15;
  }
}
