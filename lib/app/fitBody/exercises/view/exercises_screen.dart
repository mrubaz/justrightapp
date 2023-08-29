import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/widgets.dart';
import '../controller/exercises_controller.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExerciseController());
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: GetBuilder<ExerciseController>(
        builder: (_) {
          return SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: !controller.isLoading.value
                ? ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.exercises.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),
                          Text(
                            controller.exercises[index].name.toString(),
                            style: StyleRefer.poppinsRegular.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.checkbox),
                          ),
                          const SizedBox(height: 17),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.exrcisesDetails.length,
                            shrinkWrap: true,
                            itemBuilder: (_, i) {
                              return Column(
                                children: [
                                  ...controller.exrcisesDetails
                                      .where((p0) =>
                                          p0.exerciseTypeId ==
                                          controller.exercises[index].id)
                                      .map((e) {
                                    return Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            controller.exercisesIndex.value = i;
                                            controller.exerciseVideoPath =
                                                e.videoUrl;
                                            controller.toExerciseVideo();
                                          },
                                          child: WorkoutSetsWidget(
                                            isNetwork: true,
                                            imageRef: e.thumbnail,
                                            text: e.title,
                                            duration: "${e.duration} mins",
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    );
                                  }).toList()
                                ],
                              );
                            },
                          ),
                        ],
                      );
                    },
                  )
                : ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, index) => const ExerisesSkelton(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                  ),
          );
        },
      ),
    );
  }
}
