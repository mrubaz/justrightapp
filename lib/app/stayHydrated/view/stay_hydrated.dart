import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';
import '../controller/stay_hydrated_controller.dart';

class StayHydratedScreen extends StatelessWidget {
  StayHydratedScreen({Key? key}) : super(key: key);

  final _controller = Get.put(StayHydratedController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StayHydratedController>(builder: (_) {
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
                  SizedBox(height: Get.height * (0.23)),
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
                          Text("${_controller.givenTarget} / ",
                              style: StyleRefer.poppinsMedium.copyWith(
                                overflow: TextOverflow.clip,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blueButton,
                              )),
                          Text(_controller.total.toString(),
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
                              value: _controller.getProgressBarPercentage(),
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
            title: AppStrings.logWater,
            minWidth: Get.width * 0.7,
            onTap: () => _controller.goToConfirmScreen(),
            color: AppColors.blueButton,
          ),
        ),
      );
    });
  }
}
