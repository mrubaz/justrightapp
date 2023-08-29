import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';
import '../controller/workout_controller.dart';

class WorkoutScreen extends StatelessWidget {
  WorkoutScreen({Key? key}) : super(key: key);
  final _controller = Get.put(WorkOutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGreenColor,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                tileMode: TileMode.clamp,
                colors: [
              Colors.black,
              Colors.transparent,
              Colors.transparent
            ])),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CustomWidget(
                title: AppStrings.workouts,
                toBack: () {
                  _controller.back();
                },
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.fullbodyWorkout,
                              style: StyleRefer.poppinsRegular.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "${AppStrings.minsTotal} | ${AppStrings.caloriesburn}",
                              style: StyleRefer.poppinsRegular.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.checkbox),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              height: 50,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: AppColors.textFieldBorder,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 17, vertical: 14),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      AssetRef.darkCalender,
                                      color: AppColors.checkbox,
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      AppStrings.scheduleTime,
                                      style: StyleRefer.poppinsRegular.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.checkbox),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '09:00 AM',
                                      style: StyleRefer.poppinsRegular.copyWith(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.checkbox),
                                    ),
                                    const SizedBox(width: 12),
                                    Container(
                                        height: 16,
                                        width: 16,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.checkbox,
                                                width: 1)),
                                        child: SvgPicture.asset(
                                            AssetRef.arrowRightSvg))
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppStrings.exercises,
                                  style: StyleRefer.poppinsRegular.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  AppStrings.sets,
                                  style: StyleRefer.poppinsRegular.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.checkbox),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              AppStrings.set1,
                              style: StyleRefer.poppinsRegular.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.checkbox),
                            ),
                            const SizedBox(height: 17),
                            const WorkoutSetsWidget(
                              imageRef: AssetRef.squatsW,
                              text: AppStrings.squats,
                              duration: '12x',
                            ),
                            const SizedBox(height: 15),
                            const WorkoutSetsWidget(
                              imageRef: AssetRef.forearmW,
                              text: AppStrings.forearmW,
                              duration: '30 sec',
                            ),
                            const SizedBox(height: 20),
                            Text(
                              AppStrings.set2,
                              style: StyleRefer.poppinsRegular.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.checkbox),
                            ),
                            const SizedBox(height: 17),
                            const WorkoutSetsWidget(
                              imageRef: AssetRef.skippingW,
                              text: AppStrings.skippingW,
                              duration: '30x',
                            ),
                            const SizedBox(height: 15),
                            const WorkoutSetsWidget(
                              imageRef: AssetRef.pushupsW,
                              text: AppStrings.pushups,
                              duration: '12x',
                            ),
                            const SizedBox(height: 20),
                            Text(
                              AppStrings.set2,
                              style: StyleRefer.poppinsRegular.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.checkbox),
                            ),
                            const SizedBox(height: 17),
                            const WorkoutSetsWidget(
                              imageRef: AssetRef.skippingW,
                              text: AppStrings.skippingW,
                              duration: '30x',
                            ),
                            const SizedBox(height: 15),
                            const WorkoutSetsWidget(
                              imageRef: AssetRef.squatsW,
                              text: AppStrings.pushups,
                              duration: '12x',
                            ),
                            Container(
                              height: 180,
                              width: Get.width,
                              color: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 26, right: 26, bottom: 54, top: 77),
                                child: AppButton(
                                  title: AppStrings.startEvent,
                                  minWidth: Get.width * 0.7,
                                  onTap: () {
                                    _controller.gotoVideoPlayer();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
