import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';

import '../../../../models/workout_exercise_model.dart';
import '../../../../utils/constants.dart';

class WorkoutsVideoController extends GetxController {
  String vidPosMin = '', vidPosSec = '', vidDurMin = '', vidDurSec = '';
  bool showWorkoutCards = true;
  RxBool isVideoEnded = false.obs;
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  double vol = 1;
  bool isPlayPaused = false;
  int playBackTime = 0;
  RxList<WorkoutExercisesModel> workoutExercisesDetailedList = RxList([]);
  String? exercisesID;
  double videoContainerRatio = 0.5;
  int selectedIndex = 0;

  dismissVideo() {
    if (videoPlayerController!.value.isPlaying) videoPlayerController?.pause();
    chewieController = null;
    videoPlayerController = null;
    videoPlayerController?.dispose();
    chewieController?.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  double getScale() {
    double videoRatio = videoPlayerController!.value.aspectRatio;
    if (videoRatio < videoContainerRatio) {
      return videoContainerRatio / videoRatio;
    } else {
      return videoRatio / videoContainerRatio;
    }
  }

  Future<void> initVideoPlayer(String path) async {
    //video Player controller
    try {
      videoPlayerController = VideoPlayerController.network(path);
      videoPlayerController == null
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.greenColor),
            )
          : await videoPlayerController!.initialize();
      videoPlayerController!.addListener(() {
        if (videoPlayerController!.value.position == videoPlayerController!.value.duration) {
          isVideoEnded = true.obs;
          burnCalories();
          update();
        }
        WidgetsBinding.instance.addPostFrameCallback((_) {
          vidPosMin = videoPlayerController!.value.position.inMinutes.toString().padLeft(2, '0');
          vidPosSec = videoPlayerController!.value.position.inSeconds.toString().padLeft(2, '0');
          vidDurMin = videoPlayerController!.value.duration.inMinutes.toString().padLeft(2, '0');
          vidDurSec = videoPlayerController!.value.duration.inSeconds.toString().padLeft(2, '0');
          update();
        });
      });
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        aspectRatio: videoPlayerController!.value.aspectRatio,
        autoInitialize: true,
        looping: false,
        showOptions: false,
        showControls: false,
        autoPlay: true,
        errorBuilder: (context, errorMessage) {
          return Center(child: Text(errorMessage, style: const TextStyle(color: Colors.white)));
        },
        materialProgressColors: ChewieProgressColors(backgroundColor: Colors.white, playedColor: AppColors.greenColor),
        allowedScreenSleep: false,
        deviceOrientationsOnEnterFullScreen: [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ],
      );
      await chewieController!.videoPlayerController.initialize();
      await chewieController!.videoPlayerController.play();
    } catch (error) {
      log("Here is an error $error");
    }
  }

  burnCalories() {
    if (videoPlayerController!.value.position == videoPlayerController!.value.duration) {
      totalCalories = 5;
      update();
    }
  }

  pausePlay() {
    if (!isPlayPaused) {
      isPlayPaused = !isPlayPaused;
      chewieController?.pause();
      videoPlayerController?.pause();
      update();
      return;
    }
    isPlayPaused = !isPlayPaused;
    chewieController?.play();
    videoPlayerController?.play();
    update();
  }

  Future<void> destroyController() async {
    await chewieController?.pause();
    chewieController?.dispose();
    await videoPlayerController?.pause();
    await videoPlayerController?.dispose();
  }
}
