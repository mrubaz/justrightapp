import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/strings.dart';
import '../../../../utils/widgets.dart';
import '../controller/meditationcontroller.dart';

class SleepSounds extends StatelessWidget {
  const SleepSounds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MeditationController());
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
                title: AppStrings.soundSleep.toUpperCase(),
                toBack: () {
                  controller.back();
                },
              ),
              const SizedBox(height: 30),
              Expanded(
                child: GetBuilder<MeditationController>(
                  init: MeditationController(),
                  builder: (_) {
                    return !controller.isLoading.value
                        ? GridView.builder(
                            shrinkWrap: true,
                            itemCount: controller.meditation.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 13.0,
                              mainAxisSpacing: 13.0,
                            ),
                            itemBuilder: (context, index) {
                              return SleepTiles(
                                  ontap: () {
                                    controller.categoryIndex.value = index;
                                    controller.gotoSoundDetailsScreen();
                                  },
                                  soundsNo:
                                      "${controller.meditation[index].sounds ?? ''} sounds",
                                  title:
                                      controller.meditation[index].name ?? "");
                            },
                          )
                        : ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (context, index) =>
                                const MeditationSkelton(),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 15),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
