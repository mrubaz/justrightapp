// import 'package:get/get.dart';
// import 'package:just_audio/just_audio.dart';

// class AudioPlayerController extends GetxController {
//   final audioPlayer = AudioPlayer().obs;
//   RxString audioPath = ''.obs;
//   RxString audioName = ''.obs;
//   Duration duration = Duration.zero;
//   Duration position = Duration.zero;
//   RxDouble vol = 1.0.obs;
//   RxBool isLoadig = false.obs;

//   @override
//   void onInit() async {
//     audioPath.value = Get.arguments['audioPath'];
//     audioName.value = Get.arguments['soundName'];

//     await audioPlayer.value.setUrl(audioPath.value.toString());

//     update();
//     audioPlayer.value.playerStateStream.listen((event) {
//       update();
//     });
//     audioPlayer.value.durationStream.listen((newduartion) {
//       duration = newduartion!;
//       update();
//     });
//     audioPlayer.value.positionStream.listen((newposition) {
//       position = newposition;
//       if (position.inSeconds >= duration.inSeconds) {
//         position = const Duration(seconds: 0);
//       }
//       update();
//     });
//     super.onInit();
//   }
// }
