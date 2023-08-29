import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/widgets.dart';
import '../controller/skeletonview_controller.dart';

class SkeletonView extends StatelessWidget {
  const SkeletonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SkeletonViewController());
    return Scaffold(
        backgroundColor: AppColors.darkGreenColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      Row(
                        children: [
                          SingleSketonWidget(
                              height: 45,
                              width: 45,
                              radius: 50,
                              color: Colors.white.withOpacity(0.3)),
                          const SizedBox(width: 12),
                          SingleSketonWidget(
                              height: 40,
                              width: 220,
                              radius: 6,
                              color: Colors.white.withOpacity(0.3)),
                          const Spacer(),
                          SingleSketonWidget(
                              height: 45,
                              width: 35,
                              radius: 50,
                              color: Colors.white.withOpacity(0.3)),
                        ],
                      ),
                      SizedBox(height: Get.height * (0.0209)),
                      SingleSketonWidget(
                          height: 13,
                          width: 300,
                          radius: 6,
                          color: Colors.white.withOpacity(0.3)),
                      SizedBox(height: Get.height * (0.002)),
                      SingleSketonWidget(
                          height: 13,
                          width: 250,
                          radius: 6,
                          color: Colors.white.withOpacity(0.3)),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.036),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SingleSketonWidget(
                          height: 150,
                          width: 165,
                          radius: 20,
                          color: AppColors.textFieldBorder,
                          widget: Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SingleSketonWidget(
                                    height: 22,
                                    width: 90,
                                    radius: 4,
                                    color: Colors.white.withOpacity(0.3)),
                                SizedBox(height: Get.height * (0.008)),
                                SingleSketonWidget(
                                    height: 22,
                                    width: 90,
                                    radius: 4,
                                    color: Colors.white.withOpacity(0.3)),
                                SizedBox(height: Get.height * (0.013)),
                                SingleSketonWidget(
                                    height: 55,
                                    width: 55,
                                    radius: 50,
                                    color: Colors.white.withOpacity(0.3)),
                              ],
                            ),
                          )),
                      SingleSketonWidget(
                          height: 150,
                          width: 165,
                          radius: 20,
                          color: AppColors.textFieldBorder,
                          widget: Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SingleSketonWidget(
                                    height: 20,
                                    width: 90,
                                    radius: 4,
                                    color: Colors.white.withOpacity(0.3)),
                                SizedBox(height: Get.height * (0.008)),
                                SingleSketonWidget(
                                    height: 22,
                                    width: 110,
                                    radius: 4,
                                    color: Colors.white.withOpacity(0.3)),
                                SizedBox(height: Get.height * (0.013)),
                                SingleSketonWidget(
                                    height: 50,
                                    width: 110,
                                    radius: 16,
                                    color: Colors.white.withOpacity(0.3)),
                              ],
                            ),
                          )),
                    ],
                  ),
                  SizedBox(height: Get.height * (0.013)),
                  SingleSketonWidget(
                      height: 150,
                      width: 165,
                      radius: 20,
                      color: AppColors.textFieldBorder,
                      widget: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SingleSketonWidget(
                                height: 22,
                                width: 90,
                                radius: 4,
                                color: Colors.white.withOpacity(0.3)),
                            SizedBox(height: Get.height * (0.008)),
                            SingleSketonWidget(
                                height: 22,
                                width: 90,
                                radius: 4,
                                color: Colors.white.withOpacity(0.3)),
                            SizedBox(height: Get.height * (0.013)),
                            SingleSketonWidget(
                                height: 55,
                                width: 55,
                                radius: 50,
                                color: Colors.white.withOpacity(0.3)),
                          ],
                        ),
                      )),
                  SizedBox(height: Get.height * (0.03)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SingleSketonWidget(
                          height: 25,
                          width: 145,
                          radius: 6,
                          color: Colors.white.withOpacity(0.3)),
                      SingleSketonWidget(
                          height: 30,
                          width: 80,
                          radius: 16,
                          color: Colors.white.withOpacity(0.3)),
                    ],
                  ),
                  SizedBox(height: Get.height * (0.02)),
                  SingleSketonWidget(
                      height: 225,
                      width: 345,
                      radius: 20,
                      color: AppColors.textFieldBorder,
                      widget: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            SingleSketonWidget(
                                height: 135,
                                width: 283,
                                radius: 16,
                                color: Colors.white.withOpacity(0.3)),
                            SizedBox(height: Get.height * (0.01)),
                            SingleSketonWidget(
                                height: 12,
                                width: 283,
                                radius: 4,
                                color: Colors.white.withOpacity(0.3)),
                            SizedBox(height: Get.height * (0.02)),
                            SingleSketonWidget(
                                height: 12,
                                width: 283,
                                radius: 4,
                                color: Colors.white.withOpacity(0.3)),
                          ],
                        ),
                      )),
                  SizedBox(height: Get.height * (0.02)),
                  SingleSketonWidget(
                      height: 25,
                      width: 145,
                      radius: 6,
                      color: Colors.white.withOpacity(0.3)),
                  SizedBox(height: Get.height * (0.02)),
                  SingleSketonWidget(
                      height: 160,
                      width: 340,
                      radius: 6,
                      color: Colors.white.withOpacity(0.3),
                      widget: Padding(
                        padding: const EdgeInsets.only(top: 100, left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SingleSketonWidget(
                                height: 14,
                                width: 110,
                                radius: 16,
                                color: Colors.white.withOpacity(0.3)),
                            SizedBox(height: Get.height * (0.01)),
                            SingleSketonWidget(
                                height: 14,
                                width: 80,
                                radius: 4,
                                color: Colors.white.withOpacity(0.3)),
                          ],
                        ),
                      )),
                  SizedBox(height: Get.height * (0.03)),
                ],
              ),
            ),
          ),
        ));
  }
}
