import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../models/journal_model.dart';
import '../../../services/adminbasecontroller.dart';
import '../../../utils/methods.dart';
import '../../fitBody/workouts/view/workout_exercises.dart';
import '../../fitMind/jorunals/view/add_journals.dart';
import '../../fitMind/meditation/view/justright_meditation.dart';
import '../../notification/view/notification.dart';
import '../../profile/view/profile.dart';
import '../../stayHydrated/view/stay_hydrated.dart';
import '../view/latest_journal.dart';

class HomeScreenController extends GetxController {
  List<String> weekdays = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
  ];

  RxList<JournalModel> tasksList = RxList([]);
  String? userDate;
  DateTime? date;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? userName;

  @override
  void onInit() {
    userName = _auth.currentUser!.displayName;
    AdminBaseController.userData.value.userName =
        userName ?? AdminBaseController.userData.value.userName;
    getLatestJournals();
    update();
    super.onInit();
  }

  loader() async {
    getLatestJournals();
    await getWorkouts();
    update();
  }

  getLatestJournals() async {
    try {
      tasksList.clear();
      final userID = auth.currentUser!.uid;
      final db = await FirebaseFirestore.instance
          .collection("users")
          .doc(userID)
          .collection("dailyjournals")
          .orderBy("createdAt", descending: true)
          .limit(1)
          .get();
      tasksList.clear();
      for (final element in db.docs) {
        tasksList.add(JournalModel.fromJson(element.data()));
        update();
      }

      Timestamp? t = tasksList.last.createdAt;
      date = t?.toDate();
      update();
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }

  void goToStayHydratedScreen() {
    Get.to(() => StayHydratedScreen());
  }

  void goToSoundSleep() {
    Get.to(() => const SleepSounds());
  }

  gotoJournaladd() {
    Get.to(() => const AddJustRigthJournal());
  }

  void seeMore() {
    Get.to(() => const LatestJournalSreen());
  }

  gotoWorkoutsDetails() {
    Get.to(() => WorkoutExercises(
          jIndex: workoutIndex.toInt(),
          workoutsList: workouts,
        ));
  }

  gotoProfile() {
    Get.to(() => ProfileScreen());
  }

  gotoNotification() {
    Get.to(() => const NotificationScreen());
  }
}
