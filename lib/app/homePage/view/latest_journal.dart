import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';
import '../controller/home_screen_controller.dart';

class LatestJournalSreen extends StatelessWidget {
  const LatestJournalSreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return Scaffold(
      backgroundColor: AppColors.darkGreenColor,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                CustomWidget(
                  title: AppStrings.jusr1ghtJournal.toUpperCase(),
                  toBack: () {
                    Get.back();
                  },
                ),
                SizedBox(height: Get.height * 0.045),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          controller.tasksList.last.title.toString(),
                          overflow: TextOverflow.visible,
                          style: StyleRefer.poppinsSemiBold.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${controller.date?.day ?? ''} ${numbertoMonthMap[controller.date?.month ?? '']}',
                            style: StyleRefer.poppinsRegular.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w800),
                          ),
                          Text(
                            '${controller.date?.year ?? ''} ${numbertoWeekMap[controller.date?.weekday ?? '']}',
                            style: StyleRefer.poppinsRegular.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w800),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(
                    color: AppColors.dotsColors, thickness: 2, height: 10.0),
                SizedBox(height: Get.height * 0.01),
                Expanded(
                    child: SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: Get.height * (0.02)),
                      GetBuilder<HomeScreenController>(builder: (context1) {
                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                controller.tasksList.last.journalsTasks?.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          controller
                                                  .tasksList
                                                  .last
                                                  .journalsTasks?[index]
                                                  .checkmark !=
                                              controller
                                                  .tasksList
                                                  .last
                                                  .journalsTasks?[index]
                                                  .checkmark;
                                          controller.update();
                                        },
                                        child: Container(
                                          height: 22,
                                          width: 22,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            color: AppColors.checkbox,
                                          ),
                                          child: controller
                                                      .tasksList
                                                      .last
                                                      .journalsTasks?[index]
                                                      .checkmark ==
                                                  true
                                              ? const Center(
                                                  child: Icon(
                                                    Icons.check,
                                                    color: Colors.white,
                                                  ),
                                                )
                                              : const SizedBox(),
                                        ),
                                      ),
                                      SizedBox(width: Get.width * 0.022),
                                      Expanded(
                                        child: Text(
                                          "${index + 1}. ${controller.tasksList.last.journalsTasks?[index].task ?? ''}",
                                          overflow: TextOverflow.visible,
                                          textAlign: TextAlign.start,
                                          style: StyleRefer.poppinsMedium
                                              .copyWith(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: Get.height * (0.0147)),
                                ],
                              );
                            });
                      }),
                      SizedBox(height: Get.height * (0.1)),
                    ],
                  ),
                )),
              ],
            )),
      ),
    );
  }
}
