import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../services/adminbasecontroller.dart';

import '../../../utils/constants.dart';
import '../../../utils/methods.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';
import '../controller/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return GetBuilder<HomeScreenController>(builder: (_) {
      return SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => controller.gotoProfile(),
                        child: GetBuilder<AdminBaseController>(
                          builder: (controller) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: CircleAvatar(
                                backgroundColor: AppColors.dotsColors,
                                radius: 20,
                                child: AdminBaseController
                                            .userData.value.urlImage !=
                                        null
                                    ? Image.network(
                                        "${AdminBaseController.userData.value.urlImage}",
                                        fit: BoxFit.cover,
                                        height: 40,
                                        width: 40,
                                      )
                                    : const Icon(
                                        Icons.person_rounded,
                                        size: 30,
                                        color: AppColors.textFieldBorder,
                                      ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      GetBuilder<AdminBaseController>(
                        builder: (controller) {
                          return Expanded(
                            child: Text(
                                AdminBaseController.userData.value.userName ??
                                    "",
                                overflow: TextOverflow.visible,
                                style: StyleRefer.integralRegular.copyWith(
                                  overflow: TextOverflow.clip,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                )),
                          );
                        },
                      ),
                      InkWell(
                          onTap: () => controller.gotoNotification(),
                          child: SvgPicture.asset(
                              AssetRef.unreadNotificationIcon)),
                    ],
                  ),
                  SizedBox(height: Get.height * (0.0209)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('" ${AppStrings.thebestpreparationtext}',
                          style: StyleRefer.openSansCondensedSemiBold.copyWith(
                            overflow: TextOverflow.clip,
                            fontSize: 10,
                            color: AppColors.quoteText,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.learnfromyesterdattext,
                        style: StyleRefer.openSansCondensedSemiBold.copyWith(
                          overflow: TextOverflow.visible,
                          fontSize: 10,
                          color: AppColors.quoteText,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                ],
              ),
              Container(
                constraints: BoxConstraints(
                  minHeight: Get.height * 0.40,
                ),
                width: Get.width,
                child: Stack(
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: controller.tasksList.isEmpty
                          ? Align(
                              alignment: Alignment.topLeft,
                              child: GestureDetector(
                                onTap: () => {controller.gotoJournaladd()},
                                child: Container(
                                  padding: const EdgeInsets.all(14),
                                  width: Get.width * 0.41,
                                  decoration: BoxDecoration(
                                      color: AppColors.borderColor,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(controller.userDate ?? "",
                                          style:
                                              StyleRefer.poppinsMedium.copyWith(
                                            overflow: TextOverflow.clip,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          )),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(AppStrings.dailyJournal,
                                          style: StyleRefer.poppinsSemiBold
                                              .copyWith(
                                            color: AppColors.greenColor,
                                            overflow: TextOverflow.clip,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 55,
                                        width: 55,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: AppColors.greenColor),
                                        child: const Icon(Icons.add),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Align(
                              alignment: Alignment.centerLeft,
                              child: GetBuilder<HomeScreenController>(
                                builder: (contoller) {
                                  return Container(
                                    padding: const EdgeInsets.all(14),
                                    width: Get.width * 0.41,
                                    decoration: BoxDecoration(
                                        color: AppColors.borderColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                controller
                                                        .tasksList.last.title ??
                                                    "",
                                                style: StyleRefer
                                                    .poppinsSemiBold
                                                    .copyWith(
                                                  fontSize: 14,
                                                  color: AppColors.greenColor,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                controller.gotoJournaladd();
                                              },
                                              child: Container(
                                                height: Get.width * 0.064,
                                                width: Get.width * 0.064,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    color:
                                                        AppColors.greenColor),
                                                child: const Icon(Icons.add),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: Get.height * (0.017)),
                                        Text(
                                          "${controller.date?.day ?? ''} ${numbertoMonthMap[controller.date?.month ?? '']}, ${controller.date?.year ?? ''}",
                                          style: StyleRefer.poppinsMedium
                                              .copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(height: Get.height * (0.017)),
                                        GetBuilder<HomeScreenController>(
                                          builder: (context1) {
                                            return ListView.builder(
                                              itemCount: controller.tasksList
                                                  .last.journalsTasks?.length,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    CustomCheckBoxTile(
                                                      titleCheckBox: controller
                                                              .tasksList
                                                              .last
                                                              .journalsTasks?[
                                                                  index]
                                                              .task ??
                                                          "",
                                                      isChecked: controller
                                                              .tasksList
                                                              .last
                                                              .journalsTasks?[
                                                                  index]
                                                              .checkmark ??
                                                          false,
                                                      onTapCheckBox: () {
                                                        controller
                                                                .tasksList
                                                                .last
                                                                .journalsTasks?[
                                                                    index]
                                                                .checkmark !=
                                                            controller
                                                                .tasksList
                                                                .last
                                                                .journalsTasks?[
                                                                    index]
                                                                .checkmark;
                                                        controller.update();
                                                      },
                                                    ),
                                                    SizedBox(
                                                        height: Get.height *
                                                            (0.0147)),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        ),
                                        SizedBox(height: Get.height * (0.0135)),
                                        GestureDetector(
                                          onTap: () {
                                            controller.seeMore();
                                          },
                                          child: SizedBox(
                                            height: 18,
                                            width: Get.width * (0.1253),
                                            child: Text(
                                              AppStrings.seeMore,
                                              style: StyleRefer.poppinsRegular
                                                  .copyWith(
                                                      fontSize: 10,
                                                      color: AppColors
                                                          .gradientgreenColor,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontStyle:
                                                          FontStyle.italic),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: Get.height * (0.0135)),
                                      ],
                                    ),
                                  );
                                },
                              )),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => controller.goToSoundSleep(),
                        child: Container(
                          padding: const EdgeInsets.only(top: 20, left: 25),
                          width: Get.width * 0.43,
                          decoration: BoxDecoration(
                              color: AppColors.borderColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(AppStrings.sleep,
                                  style: StyleRefer.poppinsMedium.copyWith(
                                    overflow: TextOverflow.clip,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  )),
                              SizedBox(height: Get.height * (0.005)),
                              Text(AppStrings.startlistening,
                                  style: StyleRefer.poppinsSemiBold.copyWith(
                                    color: AppColors.greenColor,
                                    overflow: TextOverflow.clip,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  )),
                              SizedBox(height: Get.height * (0.0061)),
                              Image.asset(
                                AssetRef.sinusoidalpng,
                                height: 70,
                              ),
                              SizedBox(height: Get.height * (0.0061)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      bottom: 37,
                      left: controller.tasksList.isEmpty ? 0 : Get.width * 0.45,
                      duration: const Duration(milliseconds: 250),
                      child: InkWell(
                        onTap: () => controller.goToStayHydratedScreen(),
                        child: AnimatedContainer(
                          width: Get.width * 0.43,
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          decoration: BoxDecoration(
                              color: AppColors.borderColor,
                              borderRadius: BorderRadius.circular(20)),
                          duration: const Duration(seconds: 5),
                          curve: Curves.bounceIn,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '1130 / ',
                                    style: StyleRefer.poppinsMedium.copyWith(
                                      overflow: TextOverflow.clip,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.lightBlue,
                                    ),
                                  ),
                                  Text('2280ml',
                                      style: StyleRefer.poppinsMedium.copyWith(
                                        overflow: TextOverflow.clip,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ],
                              ),
                              SizedBox(height: Get.height * (0.0061)),
                              Text(AppStrings.stayHydrated,
                                  style: StyleRefer.poppinsSemiBold.copyWith(
                                    color: AppColors.greenColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  )),
                              SizedBox(height: Get.height * (0.0073)),
                              Image.asset(
                                AssetRef.waterDrop,
                                width: 55,
                                height: 55,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.workoutProgress,
                    style: StyleRefer.poppinsSemiBold.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.lightText),
                  ),
                  Container(
                    height: Get.height * (0.0369),
                    width: Get.width * (0.2026),
                    decoration: BoxDecoration(
                      color: AppColors.greenColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.weekly,
                            style: StyleRefer.poppinsBold.copyWith(
                                fontSize: 10, fontWeight: FontWeight.w400),
                          ),
                          const Icon(Icons.keyboard_arrow_down,
                              color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: Get.height * (0.285),
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                    color: AppColors.borderColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: BarChart(
                        swapAnimationCurve: Curves.bounceOut,
                        BarChartData(
                            alignment: BarChartAlignment.center,
                            maxY: 20,
                            minY: 0,
                            borderData: FlBorderData(
                              border: const Border(
                                left: BorderSide.none,
                                right: BorderSide.none,
                                top: BorderSide.none,
                                bottom: BorderSide(
                                  color: AppColors.checkbox,
                                  width: 2,
                                ),
                              ),
                            ),
                            groupsSpace: 34,
                            backgroundColor: Colors.transparent,
                            gridData: FlGridData(
                              drawVerticalLine: false,
                              getDrawingHorizontalLine: (value) {
                                return const FlLine(
                                  color: AppColors.checkbox,
                                  strokeWidth: 1,
                                  dashArray: [10, 0],
                                );
                              },
                            ),
                            barTouchData: BarTouchData(enabled: true),
                            titlesData: FlTitlesData(
                              leftTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              rightTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  reservedSize: 40,
                                  showTitles: true,
                                  getTitlesWidget: (i, meta) {
                                    controller.weekdays;
                                    return Text(
                                      controller.weekdays[i.toInt()],
                                      style:
                                          StyleRefer.poppinsSemiBold.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.checkbox,
                                      ),
                                    );
                                  },
                                  interval: 10,
                                ),
                                drawBelowEverything: true,
                              ),
                            ),
                            barGroups: [
                              for (int i = 0; i < 7; i++)
                                BarChartGroupData(
                                  x: i,
                                  barRods: [
                                    BarChartRodData(
                                      toY: (i + 4),
                                      borderRadius: BorderRadius.circular(0),
                                      fromY: 0,
                                      width: 6,
                                      color: AppColors.checkbox,
                                    ),
                                  ],
                                ),
                            ]),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.total,
                          style: StyleRefer.poppinsSemiBold.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(width: 23),
                        SvgPicture.asset(AssetRef.fire),
                        const SizedBox(width: 5),
                        Text(
                          "180${AppStrings.kCal}",
                          style: StyleRefer.poppinsRegular.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(width: 23),
                        SvgPicture.asset(AssetRef.clock),
                        const SizedBox(width: 5),
                        Text(
                          AppStrings.time,
                          style: StyleRefer.poppinsRegular.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Text(
                AppStrings.todayWorkoutPlan,
                style: StyleRefer.poppinsSemiBold
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 14),
              GetBuilder<HomeScreenController>(
                init: controller,
                builder: (context1) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: workouts.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () => {
                              workoutIndex = index.obs,
                              controller.gotoWorkoutsDetails()
                            },
                            child: Stack(
                              children: [
                                Container(
                                  height: Get.height * 0.2,
                                  width: Get.width * 0.9,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Image.network(
                                      workouts[index].image ?? ""),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 6.8, right: 2.1, left: 2.8),
                                  child: Container(
                                    height: Get.height * 0.184,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: SizedBox(
                                    height: Get.height * 0.18,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          workouts[index].title ?? "",
                                          style: StyleRefer.poppinsSemiBold
                                              .copyWith(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "|",
                                              style: StyleRefer.poppinsBold
                                                  .copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.greenColor,
                                              ),
                                            ),
                                            const SizedBox(width: 4.5),
                                            Text(
                                              "${workouts[index].exercisesNumber ?? ''} exercises",
                                              style: StyleRefer.poppinsMedium
                                                  .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.greenColor,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                        ],
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ));
    });
  }
}
