import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/strings.dart';
import '../../../../utils/widgets.dart';
import '../controller/journal_list_controller.dart';

class JournalList extends StatelessWidget {
  const JournalList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(JournalListController());
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
                  showAddAction: true,
                  toBack: () {
                    controller.back();
                  },
                  onTap: () {
                    controller.gotoJournaladd();
                  }),
              const SizedBox(height: 50),
              Expanded(
                child: SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: GetBuilder<JournalListController>(
                    initState: (state) {
                      Get.find<JournalListController>().getAllJournals();
                    },
                    builder: (context) {
                      return Column(
                        children: [
                          !controller.isLoading.value
                              ? () {
                                  if (controller.fetchData.value == 0) {
                                    return Center(
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 100),
                                          Container(
                                            height: 150,
                                            decoration: const BoxDecoration(
                                              color: AppColors.greenColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                            ),
                                            child:
                                                Image.asset(AssetRef.emptyList),
                                          ),
                                          const SizedBox(height: 10),
                                          Text("Add ${AppStrings.dailyJournal}",
                                              style: StyleRefer.poppinsSemiBold
                                                  .copyWith(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600))
                                        ],
                                      ),
                                    );
                                  } else if (controller.fetchData.value == 1) {
                                    return Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 300),
                                        child: Container(
                                          height: 60,
                                          width: 200,
                                          decoration: const BoxDecoration(
                                            color: AppColors.greenColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                          ),
                                          child: Center(
                                              child: Text(
                                            "Loading....",
                                            style: StyleRefer.openSansSemiBold
                                                .copyWith(fontSize: 20),
                                          )),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return GetBuilder<JournalListController>(
                                      initState: (state) {
                                        Get.find<JournalListController>()
                                            .getAllJournals();
                                      },
                                      builder: (controller) {
                                        return ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount:
                                                controller.journals.length,
                                            itemBuilder: (context, newIndex) {
                                              Timestamp t = controller
                                                  .journals[newIndex]
                                                  .createdAt as Timestamp;
                                              DateTime date = t.toDate();
                                              return GestureDetector(
                                                onTap: () {
                                                  controller.journalIndex =
                                                      newIndex.obs;
                                                  controller.goToJournalDesc();
                                                },
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12),
                                                      decoration: BoxDecoration(
                                                        color: AppColors
                                                            .textFieldBorder,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            height: Get.height *
                                                                (0.08),
                                                            width: Get.width *
                                                                (0.152),
                                                            decoration: BoxDecoration(
                                                                color: AppColors
                                                                    .tileGrey,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12)),
                                                            child: SizedBox(
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            Get.height *
                                                                                0.01),
                                                                child: Column(
                                                                  children: [
                                                                    Text(
                                                                      "${date.day}",
                                                                      style: StyleRefer.poppinsRegular.copyWith(
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                    Text(
                                                                      "${numbertoMonthMap[date.month]}",
                                                                      style: StyleRefer.poppinsRegular.copyWith(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              width: Get.width *
                                                                  (0.04)),
                                                          Expanded(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  controller
                                                                      .journals[
                                                                          newIndex]
                                                                      .title
                                                                      .toString(),
                                                                  style: StyleRefer
                                                                      .poppinsSemiBold
                                                                      .copyWith(
                                                                          fontSize:
                                                                              16),
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        "1. ${controller.journals[newIndex].journalsTasks![0].task},",
                                                                        style: StyleRefer.poppinsRegular.copyWith(
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                AppColors.checkbox),
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        "2. ${controller.journals[newIndex].journalsTasks![1].task},",
                                                                        style: StyleRefer.poppinsRegular.copyWith(
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                AppColors.checkbox),
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 20,
                                                            width: 20,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 1.5),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(4.0),
                                                              child:
                                                                  Image.asset(
                                                                AssetRef
                                                                    .arrowRight,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 16),
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                    );
                                  }
                                }()
                              : ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 7,
                                  itemBuilder: (context, index) =>
                                      const Skelton(),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(height: 20),
                                ),
                          const SizedBox(height: 50),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
