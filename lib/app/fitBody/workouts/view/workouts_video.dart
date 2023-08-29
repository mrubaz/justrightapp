import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../models/workout_exercise_model.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/strings.dart';
import '../../../../utils/widgets.dart';
import '../controller/workouts_video_controller.dart';

class WorkoutsVideo extends StatelessWidget {
  const WorkoutsVideo(
      {Key? key,
      required this.workoutExercisesList,
      required this.exercisesIndex})
      : super(key: key);
  final RxList<WorkoutExercisesModel> workoutExercisesList;
  final int exercisesIndex;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WorkoutsVideoController());
    controller.workoutExercisesDetailedList = workoutExercisesList;
    final size = MediaQuery.of(context).size;
    return GetBuilder<WorkoutsVideoController>(
        init: WorkoutsVideoController(),
        dispose: (_) async {
          await controller.destroyController();
        },
        initState: (_) async {
          controller.exercisesID = workoutExercisesList[exercisesIndex].id;
          controller.isVideoEnded = false.obs;
          await controller
              .initVideoPlayer(
                  workoutExercisesList[exercisesIndex].videoUrl.toString())
              .whenComplete(() {
            controller.videoPlayerController!.setVolume(1.0);
          });
        },
        builder: (_) {
          return Scaffold(
            backgroundColor: AppColors.darkGreenColor,
            body: controller.videoPlayerController == null
                ? const Offstage()
                : Stack(
                    children: [
                      SizedBox(
                        height: double.infinity,
                        child: controller.chewieController == null
                            ? const Center(
                                child: CircularProgressIndicator(
                                    color: AppColors.greenColor),
                              )
                            : Transform.scale(
                                scale: controller.getScale(),
                                child: AspectRatio(
                                    aspectRatio: controller.videoContainerRatio,
                                    child: Chewie(
                                        controller:
                                            controller.chewieController!)),
                              ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Get.width * (0.064),
                            vertical: Get.height * (0.07)),
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16)),
                          child: IconButton(
                            splashRadius: 16,
                            icon: const Icon(
                              CupertinoIcons.back,
                              size: 13,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: size.width,
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5)),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  children: [
                                    Text(
                                      AppStrings.fullbodyWorkout,
                                      style: StyleRefer.poppinsRegular.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        controller.showWorkoutCards =
                                            !controller.showWorkoutCards;
                                        controller.update();
                                      },
                                      child: controller.showWorkoutCards
                                          ? SvgPicture.asset(
                                              AssetRef.dropUpIcon)
                                          : SvgPicture.asset(
                                              AssetRef.dropDownIcon),
                                    ),
                                  ],
                                ),
                              ),
                              controller.showWorkoutCards == true
                                  ? SizedBox(height: Get.height * (0.0172))
                                  : const Offstage(),
                              controller.showWorkoutCards == true
                                  ? SizedBox(
                                      height: Get.height * (0.11),
                                      child: ListView.separated(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          itemCount:
                                              workoutExercisesList.length,
                                          separatorBuilder: (context, index) {
                                            return const SizedBox(width: 10);
                                          },
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () async {
                                                await controller
                                                    .destroyController();
                                                controller.selectedIndex =
                                                    index;
                                                await controller
                                                    .initVideoPlayer(controller
                                                        .workoutExercisesDetailedList[
                                                            index]
                                                        .videoUrl
                                                        .toString());
                                                controller.update();
                                              },
                                              child: Container(
                                                width: Get.width * 0.6,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 10),
                                                decoration: BoxDecoration(
                                                  color: controller
                                                              .selectedIndex ==
                                                          index
                                                      ? AppColors.greenColor
                                                      : Colors.black
                                                          .withOpacity(0.6),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: WorkoutSetsWidget(
                                                  imageRef:
                                                      workoutExercisesList[
                                                              index]
                                                          .thumbnailurl,
                                                  text: workoutExercisesList[
                                                          index]
                                                      .title,
                                                  duration:
                                                      "${workoutExercisesList[index].durationSec}x",
                                                  isNetwork: true,
                                                ),
                                              ),
                                            );
                                          }),
                                    )
                                  : const Offstage(),
                              SizedBox(height: Get.height * (0.0172)),
                              Container(
                                height: 10,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: VideoProgressIndicator(
                                  controller.videoPlayerController!,
                                  allowScrubbing: false,
                                  colors: const VideoProgressColors(
                                    backgroundColor:
                                        Color.fromARGB(100, 0, 0, 0),
                                    bufferedColor: Color.fromARGB(100, 0, 0, 0),
                                    playedColor: AppColors.greenColor,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  children: [
                                    Text(
                                      controller.chewieController != null
                                          ? "${controller.vidPosMin}:${controller.vidPosSec}"
                                          : "00:00",
                                      style: StyleRefer.poppinsRegular.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const Spacer(),
                                    Text(
                                      controller.chewieController != null
                                          ? "${controller.vidDurMin}:${controller.vidDurSec}"
                                          : "00:00",
                                      style: StyleRefer.poppinsRegular.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        controller.videoPlayerController!
                                            .play();
                                        controller.update();
                                      },
                                      child: SizedBox(
                                          child: SvgPicture.asset(
                                              AssetRef.repeatIcon))),
                                  GestureDetector(
                                      onTap: () {
                                        controller.videoPlayerController!
                                            .seekTo(
                                          Duration(
                                              seconds: controller
                                                      .videoPlayerController!
                                                      .value
                                                      .position
                                                      .inSeconds -
                                                  5),
                                        );
                                      },
                                      child: SvgPicture.asset(
                                          AssetRef.skipBackIcon)),
                                  GestureDetector(
                                    onTap: () {
                                      controller.pausePlay();
                                    },
                                    child: controller.videoPlayerController
                                                ?.value.isPlaying ==
                                            false
                                        ? SizedBox(
                                            child: SvgPicture.asset(
                                              AssetRef.play,
                                              color: Colors.white,
                                            ),
                                          )
                                        : SizedBox(
                                            child: SvgPicture.asset(
                                              AssetRef.pauseIcon,
                                              color: Colors.white,
                                            ),
                                          ),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        controller.videoPlayerController!
                                            .seekTo(
                                          Duration(
                                              seconds: controller
                                                      .videoPlayerController!
                                                      .value
                                                      .position
                                                      .inSeconds +
                                                  5),
                                        );
                                      },
                                      child: SvgPicture.asset(
                                          AssetRef.skipfwdIcon)),
                                  GestureDetector(
                                    onTap: () {
                                      controller.vol = (controller.vol + 1) % 2;
                                      controller.videoPlayerController!
                                          .setVolume(controller.vol);
                                      controller.update();
                                    },
                                    child: controller.vol == 1
                                        ? SvgPicture.asset(AssetRef.volumeIcon)
                                        : SvgPicture.asset(AssetRef.mute),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // if (_controller.isVideoEnded == true.obs) ...[
                      //   // BackdropFilter(
                      //   //     filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      //   //     child: Padding(
                      //   //       padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08, vertical: Get.height * 0.28),
                      //   //       child: Container(
                      //   //           width: Get.width * .82,
                      //   //           height: Get.height * .43,
                      //   //           decoration: BoxDecoration(color: AppColors.textFieldBorder, borderRadius: BorderRadius.circular(16)),
                      //   //           child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                      //   //             Stack(alignment: Alignment.bottomLeft, children: [
                      //   //               Image.asset(
                      //   //                 width: Get.width,
                      //   //                 height: Get.height * .21,
                      //   //                 AssetRef.squatsEvent,
                      //   //               ),
                      //   //               Padding(
                      //   //                 padding: const EdgeInsets.all(16),
                      //   //                 child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                      //   //                   Text(
                      //   //                     AppStrings.wakeUpCall,
                      //   //                     style: StyleRefer.openSansRegular.copyWith(fontSize: 17, fontWeight: FontWeight.w600),
                      //   //                   ),
                      //   //                   Row(children: [
                      //   //                     Container(width: 2, height: 11, color: Colors.red),
                      //   //                     const SizedBox(
                      //   //                       width: 5,
                      //   //                     ),
                      //   //                     Text(
                      //   //                       AppStrings.lowerBodyStrengthSubTitle,
                      //   //                       style: StyleRefer.openSansRegular.copyWith(fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.gradientgreenColor),
                      //   //                     ),
                      //   //                   ])
                      //   //                 ]),
                      //   //               )
                      //   //             ]),
                      //   //             const SizedBox(
                      //   //               height: 12,
                      //   //             ),
                      //   //             Text(
                      //   //               AppStrings.congratulations,
                      //   //               style: StyleRefer.poppinsRegular.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                      //   //             ),
                      //   //             const SizedBox(
                      //   //               height: 5,
                      //   //             ),
                      //   //             Text(
                      //   //               AppStrings.youBurnt350kcal,
                      //   //               style: StyleRefer.poppinsRegular.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.checkbox),
                      //   //             ),
                      //   //             const SizedBox(
                      //   //               height: 17,
                      //   //             ),
                      //   //             Padding(
                      //   //               padding: const EdgeInsets.symmetric(horizontal: 32),
                      //   //               child: GestureDetector(
                      //   //                 onTap: () {
                      //   //                   _controller.destroyController();
                      //   //                   // Get.offAll(HomePage());
                      //   //                 },
                      //   //                 child: Container(
                      //   //                   padding: const EdgeInsets.symmetric(vertical: 13),
                      //   //                   decoration: BoxDecoration(color: AppColors.greenColor, borderRadius: BorderRadius.circular(30)),
                      //   //                   child: Row(
                      //   //                     mainAxisAlignment: MainAxisAlignment.center,
                      //   //                     children: [
                      //   //                       Text(
                      //   //                         AppStrings.youBurnt350kcal,
                      //   //                         style: StyleRefer.openSansRegular.copyWith(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black),
                      //   //                       ),
                      //   //                       const SizedBox(
                      //   //                         width: 17,
                      //   //                       ),
                      //   //                       SvgPicture.asset(AssetRef.arrowRightBoldSvg, color: Colors.black)
                      //   //                     ],
                      //   //                   ),
                      //   //                 ),
                      //   //               ),
                      //   //             ),
                      //   //             const SizedBox(
                      //   //               height: 16,
                      //   //             ),
                      //   //             GestureDetector(
                      //   //                 onTap: () {
                      //   //                   _controller.destroyController();
                      //   //                   Get.back();
                      //   //                 },
                      //   //                 child: Text(
                      //   //                   AppStrings.doAgian,
                      //   //                   style: StyleRefer.poppinsRegular.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.checkbox),
                      //   //                 )),
                      //   //           ])),
                      //   //     ))
                      // ]
                    ],
                  ),
          );
        });
  }
}
