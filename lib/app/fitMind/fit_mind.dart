import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../../utils/strings.dart';
import '../../utils/widgets.dart';
import 'fit_mind_controller.dart';

class FitMind extends StatelessWidget {
  FitMind({Key? key}) : super(key: key);

  final _controller = Get.put(FitMindController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.fitMindtitle.toUpperCase(),
                        style: StyleRefer.poppinsBold.copyWith(
                          overflow: TextOverflow.clip,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        )),
                    Text(AppStrings.fitMindtext,
                        style: StyleRefer.openSansRegular.copyWith(
                          overflow: TextOverflow.clip,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            CustomRoutineCard(onTap: () => _controller.gotoJournal(), imageRef: AssetRef.justRightJournal, titleText: AppStrings.jusr1ghtJournal, subTitle: AppStrings.jusr1ghtJournalSubTitle),
            const SizedBox(height: 16),
            CustomRoutineCard(onTap: () => _controller.gottoMeditation(), imageRef: AssetRef.justRightMeditation, titleText: AppStrings.jusr1ghtMeditation, subTitle: AppStrings.jusr1ghtMeditationSubTitle),
            const SizedBox(height: 16),
            CustomRoutineCard(onTap: () => _controller.gotoMotivation(), imageRef: AssetRef.justRightMotivation, titleText: AppStrings.jusr1ghtMotivation, subTitle: AppStrings.jusr1ghtMotivationSubTitle),
          ],
        ),
      ),
    ));
  }
}
