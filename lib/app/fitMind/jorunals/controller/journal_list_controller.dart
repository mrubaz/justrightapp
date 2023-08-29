import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../../models/journal_model.dart';
import '../view/add_journals.dart';
import '../view/journal_description.dart';

class JournalListController extends GetxController {
  RxInt journalIndex = 0.obs;
  final FirebaseAuth auth = FirebaseAuth.instance;
  RxList<JournalModel> journals = RxList([]);
  Rx<bool> isLoading = false.obs;
  Rx<int> fetchData = 0.obs;

  back() {
    Get.back();
  }

  gotoJournaladd() {
    Get.to(() => const AddJustRigthJournal());
  }

  @override
  void onInit() {
    loader();
    update();
    super.onInit();
  }

  loader() async {
    isLoading.value = true;
    fetchData.value = 1;
    update();
    await Future.delayed(const Duration(milliseconds: 500));
    getAllJournals();
    fetchData.value = 2;
    isLoading.value = false;
    update();
  }

  Future<void> getAllJournals() async {
    final userID = auth.currentUser!.uid;
    final db = await FirebaseFirestore.instance.collection("users").doc(userID).collection("dailyjournals").orderBy("createdAt", descending: true).get();
    journals.clear();
    for (final element in db.docs) {
      journals.add(JournalModel.fromJson(element.data()));
      update();
    }
    update();
  }

  goToJournalDesc() async {
    Get.to(() => JournalDescription(journalList: journals, jIndex: journalIndex.toInt()));
  }
}
