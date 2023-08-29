import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../utils/constants.dart';
import '../controller/exercise_video_controller.dart';

class ExerciseVideo extends StatelessWidget {
  const ExerciseVideo(
      {Key? key, required this.exercisesIndex, required this.videoPath})
      : super(key: key);
  final int exercisesIndex;
  final String videoPath;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExerciseVideoController());
    final size = MediaQuery.of(context).size;
    return GetBuilder<ExerciseVideoController>(
        init: ExerciseVideoController(),
        dispose: (_) async {
          await controller.destroyController();
        },
        initState: (_) {
          controller.isVideoEnded = false.obs;
          controller.initVideoPlayer(videoPath).whenComplete(() {
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
                                  allowScrubbing: true,
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
                                                5,
                                          ),
                                        );
                                        controller.update();
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
                                                5,
                                          ),
                                        );
                                        controller.update();
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
                    ],
                  ),
          );
        });
  }
}
