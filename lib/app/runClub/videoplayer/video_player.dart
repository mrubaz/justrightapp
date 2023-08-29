// import 'dart:ui';

// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:just_right/app/runClub/videoplayer/video_player_controller.dart';
// 
// import 'package:video_player/video_player.dart';

// import '../../homePage/home_page.dart';

// class VideoPlayerWidget extends StatelessWidget {
//   VideoPlayerWidget({Key? key}) : super(key: key);

//   final _controller = Get.put(VideoPlayerScreenController());

//   // @override
//   // void didChangeAppLifecycleState(AppLifecycleState state) {
//   //   switch (state) {
//   //     case AppLifecycleState.inactive:
//   //       {
//   //         _controller.videoPlayerController?.pause();
//   //         _controller.chewieController?.pause();
//   //       }
//   //       break;

//   //     case AppLifecycleState.paused:
//   //       {
//   //         _controller.videoPlayerController?.pause();
//   //         _controller.chewieController?.pause();
//   //       }
//   //       break;

//   //     case AppLifecycleState.detached:
//   //       {}
//   //       break;

//   //     case AppLifecycleState.resumed:
//   //       {
//   //         if (_controller.videoPlayerController != null ||
//   //             _controller.chewieController != null) {
//   //           _controller.videoPlayerController!.play();
//   //         }
//   //       }
//   //       break;

//   //     default:
//   //       {
//   //         //statements;
//   //       }
//   //       break;
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return GetBuilder<VideoPlayerScreenController>(
//         init: VideoPlayerScreenController(),
//         initState: (_) {
//           _controller.isVideoEnded = false.obs;
//           _controller.initVideoPlayer().whenComplete(() {
//             _controller.videoPlayerController!.setVolume(1.0);
//           });
//         },
//         dispose: (_) {
//           _controller.dismissVideo();
//         },
//         builder: (_) {
//           return Scaffold(
//             backgroundColor: AppColors.darkGreenColor,
//             body: Stack(
//               children: [
//                 Container(
//                     decoration: const BoxDecoration(
//                       color: Colors.transparent,
//                     ),
//                     child: _controller.chewieController == null
//                         ? const Center(child: VideoLoader())
//                         : Chewie(controller: _controller.chewieController!)),
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: Get.width * (0.064),
//                       vertical: Get.height * (0.07)),
//                   child: Container(
//                     height: 32,
//                     width: 32,
//                     decoration: BoxDecoration(
//                         color: Colors.black.withOpacity(0.2),
//                         borderRadius: BorderRadius.circular(16)),
//                     child: IconButton(
//                       splashRadius: 16,
//                       icon: const Icon(
//                         CupertinoIcons.back,
//                         size: 13,
//                         color: Colors.white,
//                       ),
//                       onPressed: () {
//                         _controller.destroyController();
//                         Get.back();
//                       },
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 0,
//                   child: SizedBox(
//                     width: size.width,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 24),
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 AppStrings.fullbodyWorkout,
//                                 style: StyleRefer.poppinsRegular.copyWith(
//                                     fontSize: 16, fontWeight: FontWeight.w600),
//                               ),
//                               const Spacer(),
//                               GestureDetector(
//                                 onTap: () {
//                                   _controller.showWorkoutCards =
//                                       !_controller.showWorkoutCards;
//                                   _controller.update();
//                                 },
//                                 child: _controller.showWorkoutCards
//                                     ? SvgPicture.asset(AssetRef.dropUpIcon)
//                                     : SvgPicture.asset(AssetRef.dropDownIcon),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: Get.height * (0.0172)),
//                           _controller.showWorkoutCards == true
//                               ? SizedBox(
//                                   height: Get.height * (0.1),
//                                   child: ListView.separated(
//                                       itemCount: 5,
//                                       separatorBuilder: (context, index) {
//                                         return const SizedBox(width: 10);
//                                       },
//                                       shrinkWrap: true,
//                                       scrollDirection: Axis.horizontal,
//                                       itemBuilder: (context, index) {
//                                         return Container(
//                                           height: Get.height * (0.0849),
//                                           decoration: BoxDecoration(
//                                             color:
//                                                 Colors.black.withOpacity(0.6),
//                                             borderRadius:
//                                                 BorderRadius.circular(12),
//                                           ),
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 6, vertical: 9),
//                                           child: const WorkoutSetsWidget(
//                                             imageRef: AssetRef.skippingW,
//                                             text: AppStrings.skippingW,
//                                             subText: '30x',
//                                           ),
//                                         );
//                                       }),
//                                 )
//                               : const Offstage(),
//                           SizedBox(height: Get.height * (0.0172)),
//                           Container(
//                             height: 10,
//                             decoration: BoxDecoration(
//                               color: Colors.transparent,
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: VideoProgressIndicator(
//                               _controller.videoPlayerController!,
//                               allowScrubbing: true,
//                               colors: const VideoProgressColors(
//                                 backgroundColor: Color.fromARGB(100, 0, 0, 0),
//                                 bufferedColor: Color.fromARGB(100, 0, 0, 0),
//                                 playedColor: AppColors.greenColor,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 6),
//                           Row(
//                             children: [
//                               Text(
//                                 "${_controller.vidPosMin}:${_controller.vidPosSec}",
//                                 style: StyleRefer.poppinsRegular.copyWith(
//                                     fontSize: 16, fontWeight: FontWeight.w600),
//                               ),
//                               const Spacer(),
//                               Text(
//                                 "${_controller.vidDurMin}:${_controller.vidDurSec}",
//                                 style: StyleRefer.poppinsRegular.copyWith(
//                                     fontSize: 16, fontWeight: FontWeight.w600),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               GestureDetector(
//                                   onTap: () {
//                                     _controller.videoPlayerController!
//                                         .seekTo(const Duration(seconds: 0));
//                                     _controller.videoPlayerController!.play();
//                                     _controller.update();
//                                   },
//                                   child: SvgPicture.asset(AssetRef.repeatIcon)),
//                               GestureDetector(
//                                   onTap: () {
//                                     _controller.videoPlayerController!.seekTo(
//                                       Duration(
//                                         seconds: _controller
//                                                 .videoPlayerController!
//                                                 .value
//                                                 .position
//                                                 .inSeconds -
//                                             10,
//                                       ),
//                                     );
//                                     _controller.update();
//                                   },
//                                   child:
//                                       SvgPicture.asset(AssetRef.skipBackIcon)),
//                               GestureDetector(
//                                 onTap: () {
//                                   _controller.pausePlay();
//                                 },
//                                 child: _controller.videoPlayerController!.value
//                                             .isPlaying ==
//                                         false
//                                     ? SvgPicture.asset(
//                                         AssetRef.play,
//                                         color: Colors.white,
//                                       )
//                                     : SvgPicture.asset(
//                                         AssetRef.pauseIcon,
//                                         color: Colors.white,
//                                       ),
//                               ),
//                               GestureDetector(
//                                   onTap: () {
//                                     _controller.videoPlayerController!.seekTo(
//                                       Duration(
//                                         seconds: _controller
//                                                 .videoPlayerController!
//                                                 .value
//                                                 .position
//                                                 .inSeconds +
//                                             10,
//                                       ),
//                                     );
//                                     _controller.update();
//                                   },
//                                   child:
//                                       SvgPicture.asset(AssetRef.skipfwdIcon)),
//                               GestureDetector(
//                                 onTap: () {
//                                   _controller.vol = (_controller.vol + 1) % 2;

//                                   _controller.videoPlayerController!
//                                       .setVolume(_controller.vol);
//                                   _controller.update();
//                                 },
//                                 child: _controller.vol == 1
//                                     ? SvgPicture.asset(AssetRef.volumeIcon)
//                                     : SvgPicture.asset(AssetRef.mute),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: Get.height * (0.0480)),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 if (_controller.isVideoEnded == true.obs) ...[
//                   BackdropFilter(
//                     filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: Get.width * 0.08,
//                           vertical: Get.height * 0.28),
//                       child: Container(
//                         width: Get.width * .82,
//                         height: Get.height * .43,
//                         decoration: BoxDecoration(
//                             color: AppColors.textFieldBorder,
//                             borderRadius: BorderRadius.circular(16)),
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Stack(alignment: Alignment.bottomLeft, children: [
//                                 Image.asset(
//                                   width: Get.width,
//                                   height: Get.height * .21,
//                                   AssetRef.squatsEvent,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(16),
//                                   child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         Text(
//                                           AppStrings.wakeUpCall,
//                                           style: StyleRefer.openSansRegular
//                                               .copyWith(
//                                                   fontSize: 17,
//                                                   fontWeight: FontWeight.w600),
//                                         ),
//                                         Row(children: [
//                                           Container(
//                                               width: 2,
//                                               height: 11,
//                                               color: Colors.red),
//                                           const SizedBox(
//                                             width: 5,
//                                           ),
//                                           Text(
//                                             AppStrings
//                                                 .lowerBodyStrengthSubTitle,
//                                             style: StyleRefer.openSansRegular
//                                                 .copyWith(
//                                                     fontSize: 13,
//                                                     fontWeight: FontWeight.w400,
//                                                     color: AppColors
//                                                         .gradientgreenColor),
//                                           ),
//                                         ])
//                                       ]),
//                                 )
//                               ]),
//                               const SizedBox(
//                                 height: 12,
//                               ),
//                               Text(
//                                 AppStrings.congratulations,
//                                 style: StyleRefer.poppinsRegular.copyWith(
//                                     fontSize: 16, fontWeight: FontWeight.w600),
//                               ),
//                               const SizedBox(
//                                 height: 5,
//                               ),
//                               Text(
//                                 AppStrings.youBurnt350kcal,
//                                 style: StyleRefer.poppinsRegular.copyWith(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                     color: AppColors.checkbox),
//                               ),
//                               const SizedBox(
//                                 height: 17,
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 32),
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     _controller.destroyController();
//                                     Get.offAll(HomePage());
//                                   },
//                                   child: Container(
//                                     padding: const EdgeInsets.symmetric(
//                                         vertical: 13),
//                                     decoration: BoxDecoration(
//                                         color: AppColors.greenColor,
//                                         borderRadius:
//                                             BorderRadius.circular(30)),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           AppStrings.youBurnt350kcal,
//                                           style: StyleRefer.openSansRegular
//                                               .copyWith(
//                                                   fontSize: 17,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: Colors.black),
//                                         ),
//                                         const SizedBox(
//                                           width: 17,
//                                         ),
//                                         SvgPicture.asset(
//                                             AssetRef.arrowRightBoldSvg,
//                                             color: Colors.black)
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 16,
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   _controller.destroyController();
//                                   Get.back();
//                                 },
//                                 child: Text(
//                                   AppStrings.doAgian,
//                                   style: StyleRefer.poppinsRegular.copyWith(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w500,
//                                       color: AppColors.checkbox),
//                                 ),
//                               ),
//                             ]),
//                       ),
//                     ),
//                   )
//                 ]
//               ],
//             ),
//           );
//         });
//   }
// }
