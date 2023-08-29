import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/meditation_model.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/widgets.dart';
import '../controller/soundsdetails_controller.dart';

class SoundDetailsScreen extends StatelessWidget {
  SoundDetailsScreen({super.key, required this.meditationList, required this.mIndex});
  final RxList<MeditationModel> meditationList;
  final int mIndex;
  final _controller = Get.put(SoundDetailsController());

  @override
  Widget build(BuildContext context) {
    _controller.soundID = meditationList[mIndex].id;
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
                title: meditationList[mIndex].name?.toUpperCase() ?? "Empty",
                toBack: () {
                  _controller.back();
                },
              ),
              const SizedBox(height: 30),
              Expanded(
                  child: GetBuilder<SoundDetailsController>(
                init: SoundDetailsController(),
                builder: (_) {
                  return !_controller.isLoading.value
                      ? GridView.builder(
                          shrinkWrap: true,
                          itemCount: _controller.soundDetails.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                          ),
                          itemBuilder: (context, index) {
                            return SleepTiles(
                              ontap: () {
                                _controller.audioUrl = _controller.soundDetails[index].audioUrl;
                                _controller.name = _controller.soundDetails[index].name;
                                _controller.gotoAudioPlayer();
                              },
                              soundsNo: _controller.soundDetails[index].duration ?? '',
                              title: _controller.soundDetails[index].name ?? "",
                            );
                          },
                        )
                      : ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) => const MeditationSkelton(),
                          separatorBuilder: (context, index) => const SizedBox(height: 15),
                        );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
