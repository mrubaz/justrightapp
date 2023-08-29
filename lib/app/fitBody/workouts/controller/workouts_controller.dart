import 'package:get/get.dart';

import '../../../../utils/methods.dart';
import '../view/workout_exercises.dart';

class WorkoutsController extends GetxController {
  gotoWorkoutsDetails() {
    Get.to(() => WorkoutExercises(
          jIndex: workoutIndex.toInt(),
          workoutsList: workouts,
        ));
  }

  back() {
    Get.back();
  }
}
