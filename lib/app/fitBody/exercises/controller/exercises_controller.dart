import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../models/exercise_model.dart';
import '../../../../models/exercisedetails_model.dart';
import '../view/exercise_video.dart';

class ExerciseController extends GetxController {
  RxList<ExerciseModel> exercises = RxList([]);
  RxList<ExerciseDetailsModel> exrcisesDetails = RxList([]);
  Rx<bool> isLoading = false.obs;
  RxInt exercisesIndex = 0.obs;
  String? exerciseVideoPath;

  toExerciseVideo() {
    Get.to(ExerciseVideo(exercisesIndex: exercisesIndex.toInt(), videoPath: exerciseVideoPath.toString()));
    update();
  }

  back() {
    Get.back();
  }

  Future<void> getExercises() async {
    final db = await FirebaseFirestore.instance.collection("exercises").orderBy("created_at").get();
    exercises.clear();
    for (final element in db.docs) {
      exercises.add(ExerciseModel.fromJson(element.data()));
    }
    update();
  }

  getExercisesDetails() async {
    exrcisesDetails.clear();
    for (int i = 0; i < exercises.length; i++) {
      final db = await FirebaseFirestore.instance.collection("exercises").doc(exercises[i].id).collection("details").get();
      for (final element in db.docs) {
        exrcisesDetails.add(ExerciseDetailsModel.fromJson(element.data()));
      }
      update();
    }
    update();
  }

  loader() async {
    isLoading.value = true;
    update();
    await Future.delayed(const Duration(milliseconds: 500));
    await getExercises();
    await getExercisesDetails();
    isLoading.value = false;
    update();
  }

  @override
  void onInit() {
    loader();
    super.onInit();
  }
}
