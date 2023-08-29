import 'package:get/get.dart';
import '../../homePage/home_page.dart';

class SkeletonViewController extends GetxController {
  @override
  void onInit() {
    stream();
    super.onInit();
  }

  stream() async {
    await Future.delayed(const Duration(milliseconds: 500), () {
      Get.offAll(const HomePage());
    });
  }
}
