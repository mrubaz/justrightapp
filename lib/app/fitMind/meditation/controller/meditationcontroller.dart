import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../../models/meditation_model.dart';
import '../view/soundsdetails_screen.dart';

class MeditationController extends GetxController {
  RxList<MeditationModel> meditation = RxList([]);
  RxInt categoryIndex = 0.obs;
  Rx<bool> isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    loader();
  }

  gotoSoundDetailsScreen() {
    Get.to(() => SoundDetailsScreen(
          mIndex: categoryIndex.toInt(),
          meditationList: meditation,
        ));
  }

  back() {
    Get.back();
  }

  getMeditations() async {
    meditation.clear();
    final db = await FirebaseFirestore.instance.collection("meditation").get();
    for (final element in db.docs) {
      meditation.add(MeditationModel.fromJson(element.data()));
    }
    update();
  }

  loader() async {
    isLoading.value = true;
    update();
    await Future.delayed(const Duration(milliseconds: 500));
    getMeditations();
    isLoading.value = false;
    update();
  }
}
