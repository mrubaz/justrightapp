import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../models/soundsdetails_model.dart';

class SoundDetailsController extends GetxController {
  RxList<SoundsDetailsModel> soundDetails = RxList([]);
  String? soundID;
  Rx<bool> isLoading = false.obs;
  String? audioUrl;
  String? name;
  @override
  void onInit() {
    super.onInit();
    loader();
  }

  gotoAudioPlayer() {
    // Get.to(() => PlayAudioScreen(), arguments: {
    //   'audioPath': audioUrl ?? "",
    //   'soundName': name ?? "",
    // });
  }

  back() {
    Get.back();
  }

  getSoundsDetails() async {
    soundDetails.clear();
    final db = await FirebaseFirestore.instance
        .collection("meditation")
        .doc(soundID)
        .collection("soundDetails")
        .get();
    for (final element in db.docs) {
      soundDetails.add(SoundsDetailsModel.fromJson(element.data()));
    }
    update();
  }

  loader() async {
    isLoading.value = true;
    update();
    await Future.delayed(const Duration(milliseconds: 500));
    getSoundsDetails();
    isLoading.value = false;
    update();
  }
}
