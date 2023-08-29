import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../models/workouts_model.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/strings.dart';
import '../../../../utils/widgets.dart';
import '../controller/workoutexercises_controller.dart';

class WorkoutExercises extends StatelessWidget {
  WorkoutExercises({Key? key, required this.workoutsList, required this.jIndex}) : super(key: key);
  final int jIndex;
  final RxList<WorkoutsModel> workoutsList;
  final _controller = Get.put(WorkoutExercisesController());

  @override
  Widget build(BuildContext context) {
    _controller.workoutsID = workoutsList[jIndex].id;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.darkGreenColor,
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.center, tileMode: TileMode.clamp, colors: [
                Color.fromARGB(205, 0, 0, 0),
                Color(0xff062029)
              ]),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  CustomWidget(
                    title: AppStrings.details,
                    toBack: () {
                      _controller.back();
                    },
                  ),
                  const SizedBox(height: 30),
                  Text(
                    AppStrings.fullbodyWorkout,
                    style: StyleRefer.poppinsRegular.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "${workoutsList[jIndex].durationMinutes} ${AppStrings.minsTotal} | ${workoutsList[jIndex].callories} ${AppStrings.caloriesburn}",
                    style: StyleRefer.poppinsRegular.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.checkbox),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 50,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: AppColors.textFieldBorder,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 14),
                      child: Row(children: [
                        SvgPicture.asset(
                          AssetRef.darkCalender,
                          color: AppColors.checkbox,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          AppStrings.scheduleTime,
                          style: StyleRefer.poppinsRegular.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.checkbox),
                        ),
                        const Spacer(),
                        Text(
                          '06:00 AM',
                          style: StyleRefer.poppinsRegular.copyWith(fontSize: 10, fontWeight: FontWeight.w400, color: AppColors.checkbox),
                        ),
                        const SizedBox(width: 12)
                      ]),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    AppStrings.exercises,
                    style: StyleRefer.poppinsRegular.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 17),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: GetBuilder<WorkoutExercisesController>(
                        init: _controller,
                        builder: (context1) {
                          return !_controller.isLoading.value
                              ? ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: _controller.workoutExercises.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        _controller.exercisesIndex = index;
                                        _controller.gotoVideoPlayer();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 18.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 60,
                                              width: 60,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                                                color: AppColors.darkGreenColor,
                                              ),
                                              child: Image.network(
                                                "${_controller.workoutExercises[index].thumbnailurl}",
                                                height: 30,
                                                width: 30,
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                            SizedBox(width: Get.width * (0.0266)),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    _controller.workoutExercises[index].title ?? "",
                                                    style: StyleRefer.poppinsRegular.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                                                  ),
                                                  Text(
                                                    "${_controller.workoutExercises[index].durationSec ?? ''} secs",
                                                    style: StyleRefer.poppinsRegular.copyWith(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.checkbox),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 7,
                                  itemBuilder: (context, index) => const WorkoutsExerisesSkelton(),
                                  separatorBuilder: (context, index) => const SizedBox(height: 15),
                                );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: Get.height * 0.05),
              child: AppButton(
                  title: AppStrings.letsStart,
                  minWidth: Get.width * 0.7,
                  onTap: () {
                    _controller.gotoVideoPlayer();
                  }),
            ))
      ],
    );
  }
}
