// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:video_player/video_player.dart';

// 

// class VideoPlayerScreenController extends GetxController {
//   String vidPosMin = '', vidPosSec = '', vidDurMin = '', vidDurSec = '';
//   bool showWorkoutCards = true;
//   RxBool isVideoEnded = false.obs;

//   VideoPlayerController? videoPlayerController;
//   ChewieController? chewieController;
//   double vol = 1;
//   bool isPlayPaused = false;
//   String videoLink = 'assets/videos/squats.mp4';

//   // @override
//   // void Oninit() {
//   //   initVideoPlayer().whenComplete(() {
//   //     videoPlayerController!.setVolume(1.0);
//   //   });

//   //   WidgetsBinding.instance.addObserver(this);
//   //   super.onInit();
//   // }

//   // @override
//   // void dispose() {
//   //   WidgetsBinding.instance.removeObserver(this);
//   //   _dismissVideo();
//   //   super.dispose();
//   // }

//   dismissVideo() {
//     if (videoPlayerController!.value.isPlaying) videoPlayerController?.pause();
//     chewieController = null;
//     videoPlayerController = null;
//     videoPlayerController?.dispose();
//     chewieController?.dispose();
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//   }

//   Future<void> initVideoPlayer() async {
//     videoPlayerController = VideoPlayerController.asset(videoLink);

//     await videoPlayerController!.initialize();

//     videoPlayerController!.addListener(() {
//       if (videoPlayerController!.value.position ==
//           videoPlayerController!.value.duration) {
//         isVideoEnded = true.obs;
//         update();
//       }

//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         vidPosMin = videoPlayerController!.value.position.inMinutes
//             .toString()
//             .padLeft(2, '0');
//         vidPosSec = videoPlayerController!.value.position.inSeconds
//             .toString()
//             .padLeft(2, '0');
//         vidDurMin = videoPlayerController!.value.duration.inMinutes
//             .toString()
//             .padLeft(2, '0');
//         vidDurSec = videoPlayerController!.value.duration.inSeconds
//             .toString()
//             .padLeft(2, '0');
//         update();

//         // setState(() {
//         //   _chewieController = null;
//         //   videoPlayerController = null;
//         // });
//       });
//     });

//     chewieController = ChewieController(
//         videoPlayerController: videoPlayerController!,
//         aspectRatio: videoPlayerController!.value.aspectRatio,
//         autoInitialize: true,
//         looping: false,
//         showOptions: false,
//         showControls: false,
//         autoPlay: true,
//         // overlay:
//         errorBuilder: (context, errorMessage) {
//           return Center(
//             child: Text(
//               errorMessage,
//               style: const TextStyle(color: Colors.white),
//             ),
//           );
//         },
//         materialProgressColors: ChewieProgressColors(
//           backgroundColor: Colors.white,
//           playedColor: AppColors.greenColor,
//         ),
//         allowFullScreen: true,
//         allowedScreenSleep: false,
//         deviceOrientationsOnEnterFullScreen: [
//           DeviceOrientation.portraitUp,
//           DeviceOrientation.portraitDown,
//         ]);
//   }

//   pausePlay() {
//     if (!isPlayPaused) {
//       isPlayPaused = !isPlayPaused;
//       chewieController?.pause();
//       videoPlayerController?.pause();
//       update();
//       return;
//     }
//     isPlayPaused = !isPlayPaused;
//     chewieController?.play();
//     videoPlayerController?.play();
//     update();
//   }

//   destroyController() {
//     videoPlayerController!.pause();
//     videoPlayerController!.dispose();
//     chewieController!.dispose();
//   }
// }
