import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';
import '../../homePage/home_page.dart';
import '../controller/stay_hydrated_confirm_controller.dart';
import '../controller/stay_hydrated_controller.dart';

class StayHydratedConfirmationScreen extends StatelessWidget {
  StayHydratedConfirmationScreen({Key? key}) : super(key: key);
  final _controller = Get.put(StayHydratedConfirmationController());
  final _stayHydratedController = Get.put(StayHydratedController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StayHydratedConfirmationController>(builder: (_) {
      return Scaffold(
        backgroundColor: AppColors.darkGreenColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  CustomWidget(
                    title: AppStrings.stayHydrated,
                    toBack: () {
                      _controller.back();
                    },
                  ),
                  SizedBox(height: Get.height * (0.04)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppStrings.dailyWaterTarget,
                          style: StyleRefer.poppinsMedium.copyWith(
                            overflow: TextOverflow.clip,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${_stayHydratedController.givenTarget} / ",
                              style: StyleRefer.poppinsMedium.copyWith(
                                overflow: TextOverflow.clip,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blueButton,
                              )),
                          Text(_stayHydratedController.total.toString(),
                              style: StyleRefer.poppinsMedium.copyWith(
                                overflow: TextOverflow.clip,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              )),
                        ],
                      ),
                      SizedBox(height: Get.height * .04),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AssetRef.halfWaterDrop),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: Get.width * .62,
                            height: 20,
                            child: LiquidLinearProgressIndicator(
                              value: _stayHydratedController.getProgressBarPercentage(),
                              valueColor: const AlwaysStoppedAnimation(AppColors.darkBlue),
                              // Defaults to the current Theme's accentColor.
                              backgroundColor: Colors.white,
                              borderColor: Colors.white,
                              borderWidth: 0.0,
                              borderRadius: 12,
                              direction: Axis.horizontal,
                            ),
                          ),
                          const SizedBox(width: 11),
                          SvgPicture.asset(AssetRef.fullWaterDrop),
                        ],
                      ),
                      SizedBox(height: Get.height * .06),
                      Padding(
                        padding: EdgeInsets.only(left: Get.width * .16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              children: [
                                Text(
                                  _controller.targetWater.toString(),
                                  style: StyleRefer.poppinsMedium.copyWith(
                                    overflow: TextOverflow.clip,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Container(
                                  width: 57,
                                  height: 1,
                                  color: AppColors.lightWhite,
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 34,
                            ),
                            Text('ml',
                                style: StyleRefer.poppinsMedium.copyWith(
                                  overflow: TextOverflow.clip,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: Get.height * .05),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _controller.setWaterMeasurement(
                                  waterMeasurement: _controller.glass.toInt(),
                                  itemClick: 1,
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: 63,
                                    height: 63,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: _controller.onItemClick == 1.obs ? AppColors.blueButton : Colors.white),
                                    child: Center(
                                      child: Image.asset(
                                        AssetRef.amlPng,
                                        width: 28,
                                        height: 28,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text('${_controller.glass}ml',
                                      style: StyleRefer.poppinsMedium.copyWith(
                                        overflow: TextOverflow.clip,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _controller.setWaterMeasurement(
                                  waterMeasurement: _controller.halfLiter.toInt(),
                                  itemClick: 2,
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: 63,
                                    height: 63,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: _controller.onItemClick == 2.obs ? AppColors.blueButton : Colors.white),
                                    child: Center(
                                      child: Image.asset(
                                        AssetRef.bmlPng,
                                        width: 47,
                                        height: 47,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text('${_controller.halfLiter}ml',
                                      style: StyleRefer.poppinsMedium.copyWith(
                                        overflow: TextOverflow.clip,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _controller.setWaterMeasurement(
                                  waterMeasurement: _controller.oneLiter.toInt(),
                                  itemClick: 3,
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: 63,
                                    height: 63,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: _controller.onItemClick == 3.obs ? AppColors.blueButton : Colors.white),
                                    child: Center(
                                      child: Image.asset(
                                        AssetRef.cmlPng,
                                        width: 47,
                                        height: 47,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text('${_controller.oneLiter}ml',
                                      style: StyleRefer.poppinsMedium.copyWith(
                                        overflow: TextOverflow.clip,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: Get.width * 0.15, right: Get.width * 0.15, bottom: 30),
          child: AppButton(
            title: AppStrings.confirm,
            minWidth: Get.width * 0.7,
            onTap: () {
              Get.offAll(() => const HomePage());
            },
            color: AppColors.blueButton,
          ),
        ),
      );
    });
  }
}
