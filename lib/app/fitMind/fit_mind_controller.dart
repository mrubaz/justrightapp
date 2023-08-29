import 'package:get/get.dart';

import 'jorunals/view/journal_list.dart';
import 'meditation/view/justright_meditation.dart';
import 'motivation/just_right_motivation.dart';

class FitMindController extends GetxController {
  gotoJournal() {
    Get.to(() => const JournalList());
  }

  gotoMotivation() {
    Get.to(() => const JustRightMotivation());
  }

  gottoMeditation() {
    Get.to(() => const SleepSounds());
  }
}
