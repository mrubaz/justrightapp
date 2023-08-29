import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/journal_model.dart';
import '../../../../utils/methods.dart';
import '../../../homePage/controller/home_screen_controller.dart';
import 'journal_list_controller.dart';

class AddJournalController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();
  final TextEditingController thirdController = TextEditingController();
  final TextEditingController fourthController = TextEditingController();
  final TextEditingController fifthController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final JournalModel journalModel = JournalModel();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> saveFiles() async {
    final userID = auth.currentUser!.uid;
    journalModel.createdAt = Timestamp.fromDate(DateTime.now());
    journalModel.id = getRandomString(15);
    journalModel.title = titleController.text;
    final List<JournalsTasks> list = [];
    list.add(JournalsTasks(task: firstController.text, checkmark: false, taskid: 1));
    list.add(JournalsTasks(task: secondController.text, checkmark: false, taskid: 2));
    list.add(JournalsTasks(task: thirdController.text, checkmark: false, taskid: 3));
    list.add(JournalsTasks(task: fourthController.text, checkmark: false, taskid: 4));
    list.add(JournalsTasks(task: fifthController.text, checkmark: false, taskid: 5));
    journalModel.journalsTasks = list;
    var listController = Get.put(JournalListController());
    listController.journals.add(journalModel);
    listController.update();
    var latestController = Get.put(HomeScreenController());
    latestController.tasksList.add(journalModel);
    latestController.update();
    update();
    await FirebaseFirestore.instance.collection("users").doc(userID).collection("dailyjournals").doc(journalModel.id).set(journalModel.toJson());
    update();
    Get.back();
  }
}
