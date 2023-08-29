import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/methods.dart';
import '../controller/workouts_controller.dart';

class WorkoutsScreen extends StatelessWidget {
  WorkoutsScreen({Key? key}) : super(key: key);
  final _controller = Get.put(WorkoutsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkoutsController>(
      init: _controller,
      builder: (context1) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: workouts.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () => {
                    workoutIndex = index.obs,
                    _controller.gotoWorkoutsDetails()
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: Get.height * 0.2,
                        width: Get.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Image.network(workouts[index].image ?? ""),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.8, right: 2.1, left: 2.8),
                        child: Container(
                          height: Get.height * 0.184,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: SizedBox(
                          height: Get.height * 0.18,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                workouts[index].title ?? "",
                                style: StyleRefer.poppinsSemiBold.copyWith(fontSize: 17, fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "|",
                                    style: StyleRefer.poppinsBold.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.greenColor,
                                    ),
                                  ),
                                  const SizedBox(width: 4.5),
                                  Text(
                                    "${workouts[index].exercisesNumber ?? ''} exercises",
                                    style: StyleRefer.poppinsMedium.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.greenColor,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
              ],
            );
          },
        );
      },
    );
  }
}
