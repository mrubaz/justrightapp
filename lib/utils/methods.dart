import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../models/usermodel.dart';
import '../models/workouts_model.dart';
import '../services/adminbasecontroller.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(this);
  }
}

String? emailValidationwhole(String? val) {
  if (EmailValidator(val!).isValidEmail()) {
    return null;
  } else if (val.isEmpty) {
    return "Email is required";
  } else {
    return "Enter correct email";
  }
}

String? nameValidation(String? val) {
  if (val!.isEmpty) {
    return 'Please enter your name';
  } else {
    return null;
  }
}

String? validatePassword(String? value) {
  if (value!.isEmpty) {
    return 'Password is not empty';
  } else {
    return null;
  }
}
// }

String formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
}

String getRandomString(int length) {
  const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random rnd = Random();
  return String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => chars.codeUnitAt(
        rnd.nextInt(chars.length),
      ),
    ),
  );
}

String getRandomSCString(int length) {
  const chars = 'abcdefghijklmnopqrstuvwxyz1234567890';
  Random rnd = Random();
  return String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => chars.codeUnitAt(
        rnd.nextInt(chars.length),
      ),
    ),
  );
}

String? textFiledValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter some text';
  }
  return null;
}

final FirebaseAuth auth = FirebaseAuth.instance;
getUserData() async {
  final userID = auth.currentUser!.uid;
  final db = await FirebaseFirestore.instance.collection("users").doc(userID).get();
  AdminBaseController.userData.value = UserData.fromMap(db.data() ?? {});
}

RxList<WorkoutsModel> workouts = RxList([]);
RxInt workoutIndex = 0.obs;
WorkoutsModel workoutsList = WorkoutsModel();
Future<void> getWorkouts() async {
  final db = await FirebaseFirestore.instance.collection("workouts").get();
  workouts.clear();
  for (final element in db.docs) {
    workoutsList = WorkoutsModel.fromJson(element.data());
    workouts.add(workoutsList);
  }
}
