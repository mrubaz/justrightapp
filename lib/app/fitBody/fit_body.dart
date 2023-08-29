import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../../utils/strings.dart';
import '../../utils/widgets.dart';
import 'exercises/view/exercises_screen.dart';
import 'fit_body_controller.dart';
import 'workouts/view/workouts_screen.dart';

class FitBodyScreen extends StatelessWidget {
  FitBodyScreen({Key? key}) : super(key: key);
  final controller = Get.put(FitBodyController);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(AppStrings.fitBodytitle.toUpperCase(),
                  style: StyleRefer.poppinsBold.copyWith(
                    overflow: TextOverflow.clip,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  )),
              Text(AppStrings.fitBodytext,
                  style: StyleRefer.openSansRegular.copyWith(
                    overflow: TextOverflow.clip,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  )),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: TwoTabsTabbarWidget(
                  firstTab: AppStrings.workouts,
                  secondTab: AppStrings.exercises,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TabBarView(
                    children: [WorkoutsScreen(), const ExerciseScreen()],
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
