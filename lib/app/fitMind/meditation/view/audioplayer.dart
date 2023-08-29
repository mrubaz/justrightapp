// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';

// import '../../../../utils/constants.dart';
// import '../../../../utils/methods.dart';
// import '../../../../utils/widgets.dart';
// import '../controller/audio_player_controller.dart';

// class PlayAudioScreen extends StatelessWidget {
//   PlayAudioScreen({
//     super.key,
//   });

//   // final _controller = Get.put(AudioPlayerController());

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AudioPlayerController>(
//       dispose: (state) {
//         _controller.audioPlayer.value.stop();
//         _controller.audioPlayer.value.dispose();
//       },
//       builder: (controller) {
//         return Obx(
//           () => Scaffold(
//             backgroundColor: AppColors.darkGreenColor,
//             body: _controller.audioPath.isNotEmpty
//                 ? SafeArea(
//                     child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 24),
//                         child: SingleChildScrollView(
//                           child: Column(
//                             children: [
//                               const SizedBox(height: 20),
//                               CustomWidget(
//                                 toBack: () {
//                                   Get.back();
//                                 },
//                               ),
//                               SizedBox(height: Get.height * (0.05)),
//                               Text(
//                                 controller.audioName.value,
//                                 style: StyleRefer.poppinsMedium.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                           height: Get.height * 0.6,
//                           child: _controller.isLoadig.value && !_controller.audioPlayer.value.playing
//                               ? const Center(
//                                   child: CircularProgressIndicator(
//                                   color: AppColors.greyColor,
//                                 ))
//                               : Lottie.asset(
//                                   AssetRef.sinosodialAnimation,
//                                   animate: _controller.audioPlayer.value.playing,
//                                   width: double.infinity,
//                                   frameRate: FrameRate.max,
//                                   repeat: _controller.audioPlayer.value.playing,
//                                 )),
//                       Slider(
//                         min: 0,
//                         max: _controller.duration.inSeconds.toDouble(),
//                         activeColor: AppColors.greenColor,
//                         inactiveColor: const Color.fromARGB(39, 128, 0, 0),
//                         value: _controller.position.inSeconds.toDouble(),
//                         onChanged: (value) async {
//                           final position = Duration(seconds: value.toInt());
//                           await _controller.audioPlayer.value.seek(position);
//                         },
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 24),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             const SizedBox(height: 6),
//                             Row(
//                               children: [
//                                 Text(
//                                   formatDuration(_controller.position),
//                                   style: StyleRefer.poppinsRegular.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
//                                 ),
//                                 const Spacer(),
//                                 Text(
//                                   formatDuration(_controller.duration),
//                                   style: StyleRefer.poppinsRegular.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 GestureDetector(
//                                     onTap: () async {
//                                       await _controller.audioPlayer.value.seek(const Duration(seconds: 0));
//                                       _controller.update();
//                                     },
//                                     child: SvgPicture.asset(AssetRef.repeatIcon)),
//                                 GestureDetector(
//                                     onTap: () {
//                                       _controller.audioPlayer.value.seek(_controller.position - const Duration(seconds: 10));
//                                     },
//                                     child: SvgPicture.asset(AssetRef.skipBackIcon)),
//                                 GestureDetector(
//                                   onTap: () async {
//                                     _controller.isLoadig = false.obs;
//                                     _controller.update();
//                                     if (_controller.audioPlayer.value.playing) {
//                                       await _controller.audioPlayer.value.pause();
//                                       _controller.update();
//                                     } else {
//                                       _controller.isLoadig = true.obs;
//                                       _controller.update();
//                                       await _controller.audioPlayer.value.play();
//                                       _controller.isLoadig = false.obs;
//                                       _controller.update();
//                                     }

//                                     _controller.update();
//                                   },
//                                   child: !_controller.audioPlayer.value.playing
//                                       ? SvgPicture.asset(
//                                           AssetRef.play,
//                                           color: Colors.white,
//                                         )
//                                       : SvgPicture.asset(
//                                           AssetRef.pauseIcon,
//                                           color: Colors.white,
//                                         ),
//                                 ),
//                                 GestureDetector(
//                                     onTap: () {
//                                       _controller.audioPlayer.value.seek(_controller.position + const Duration(seconds: 10));
//                                     },
//                                     child: SvgPicture.asset(AssetRef.skipfwdIcon)),
//                                 GestureDetector(
//                                     onTap: () {
//                                       _controller.vol.value = (_controller.vol.value + 1) % 2;
//                                       _controller.update();
//                                       _controller.audioPlayer.value.setVolume(_controller.vol.value);
//                                       _controller.update();
//                                     },
//                                     child: _controller.vol.value == 0 ? SvgPicture.asset(AssetRef.mute) : SvgPicture.asset(AssetRef.volumeIcon)),
//                               ],
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ))
//                 : const Center(
//                     child: CircularProgressIndicator(color: AppColors.greenColor),
//                   ),
//           ),
//         );
//       },
//     );
//   }
// }
