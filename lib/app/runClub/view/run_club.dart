import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';
import 'challenges_view.dart';
import 'event_view.dart';
import 'leader_board_view.dart';

class RunClubScreen extends StatelessWidget {
  const RunClubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppStrings.fitnessTitle.toUpperCase(),
                            style: StyleRefer.integralRegular.copyWith(
                              overflow: TextOverflow.clip,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            )),
                        const SizedBox(height: 4),
                        Text(AppStrings.runClubtext,
                            style: StyleRefer.openSansRegular.copyWith(
                              overflow: TextOverflow.clip,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const TabbarWidget(
                    firstTab: AppStrings.runTitle,
                    secondTab: AppStrings.workoutCreatorTitle,
                    thirdTab: AppStrings.bodyString),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [RunListScreen(), ChallengesScreen(), EventsScreen()],
            ),
          ),
        ],
      )),
    );
  }
}
