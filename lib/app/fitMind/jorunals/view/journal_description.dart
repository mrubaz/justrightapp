import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/journal_model.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/strings.dart';
import '../../../../utils/widgets.dart';
import '../controller/journal_desc_controller.dart';
import '../controller/journal_list_controller.dart';

class JournalDescription extends StatelessWidget {
  const JournalDescription(
      {Key? key, required this.journalList, required this.jIndex})
      : super(key: key);
  final RxList<JournalModel> journalList;
  final int jIndex;

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(JournalDescController());
    Get.put(JournalDescController());
    Timestamp t = journalList[jIndex].createdAt as Timestamp;
    DateTime date = t.toDate();
    bool? isChecked = journalList[jIndex].journalsTasks![jIndex].checkmark;
    return Scaffold(
        backgroundColor: AppColors.darkGreenColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            journalList[jIndex].title.toString(),
                            overflow: TextOverflow.visible,
                            style: StyleRefer.poppinsSemiBold.copyWith(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${date.day} ${numbertoMonthMap[date.month]}',
                              style: StyleRefer.poppinsRegular.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w800),
                            ),
                            Text(
                              '${date.year} ${numbertoWeekMap[date.weekday]}',
                              style: StyleRefer.poppinsMedium.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.checkbox),
                            )
                          ],
                        )
                      ],
                    )),
                const Divider(
                    color: AppColors.dotsColors, thickness: 1, height: 2),
                SizedBox(height: Get.height * 0.01),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        GetBuilder<JournalListController>(
                          builder: (context1) {
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  journalList[jIndex].journalsTasks?.length,
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
                                            // journalList[jIndex].journalsTasks?[index].checkmark = journalList[jIndex].journalsTasks?[index].checkmark;
                                            // _controller.update();
                                          },
                                          child: Container(
                                            height: 22,
                                            width: 22,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              color: AppColors.checkbox,
                                            ),
                                            child: isChecked == false
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
                                            // journalList[jIndex].journalsTasks?[index].task ?? '',
                                            journalList[jIndex]
                                                    .journalsTasks?[index]
                                                    .task ??
                                                '',
                                            overflow: TextOverflow.visible,
                                            textAlign: TextAlign.justify,
                                            style: StyleRefer.poppinsMedium
                                                .copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: Get.height * (0.0147)),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
