import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';
import '../controller/leader_board_controller.dart';

class RunListScreen extends StatelessWidget {
  final controller = Get.put(LeaderBoardController());
  RunListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 13),
          child: Column(
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LeaderBoardWidget(
                    date: "Today: 8 March",
                    steps: '5000',
                    stepsDuration: 'steps/day',
                  ),
                  LeaderBoardWidget(
                    date: '1-7 March',
                    steps: '30,000',
                    stepsDuration: 'steps/Week',
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LeaderBoardWidget(
                    date: 'March',
                    steps: '120,000',
                    stepsDuration: 'steps/month',
                  ),
                  LeaderBoardWidget(
                    date: '2023',
                    steps: '2,496,235',
                    stepsDuration: 'steps/year',
                  ),
                ],
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: Get.height * 0.04),
            child: AppButton(
                title: AppStrings.startRunning,
                minWidth: Get.width * 0.7,
                onTap: () {}),
          ),
        )
      ],
    );
  }
}
