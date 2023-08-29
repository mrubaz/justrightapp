import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../models/workout_exercise_model.dart';
import '../view/workouts_video.dart';

class WorkoutExercisesController extends GetxController {
  RxList<WorkoutExercisesModel> workoutExercises = RxList([]);
  WorkoutExercisesModel _wokoutExercisesList = WorkoutExercisesModel();
  String? workoutsID;
  Rx<bool> isLoading = false.obs;
  int exercisesIndex = 0;

  @override
  void onInit() {
    loader();
    super.onInit();
  }

  gotoVideoPlayer() {
    // Get.to(const WorkoutsVideo(), arguments: {
    //   "workoutExercisesList": workoutExercises.value,
    //   "exercisesIndex": exercisesIndex,
    // });
    Get.to(WorkoutsVideo(
      workoutExercisesList: workoutExercises,
      exercisesIndex: exercisesIndex.toInt(),
    ));
    update();
  }

  back() {
    Get.back();
  }

  getWorkoutExercises() async {
    final db = await FirebaseFirestore.instance.collection("workouts").doc(workoutsID).collection("exercises").orderBy("created_at").get();
    workoutExercises.clear();
    for (final element in db.docs) {
      _wokoutExercisesList = WorkoutExercisesModel.fromJson(element.data());
      workoutExercises.add(_wokoutExercisesList);
    }
    update();
  }

  loader() async {
    isLoading.value = true;
    update();
    await Future.delayed(const Duration(milliseconds: 500));
    getWorkoutExercises();
    isLoading.value = false;
    update();
  }
}
