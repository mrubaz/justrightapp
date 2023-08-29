import 'package:get/get.dart';

class StayHydratedConfirmationController extends GetxController {
  RxInt targetWater = 250.obs;
  RxInt glass = 250.obs;
  RxInt halfLiter = 500.obs;
  RxInt oneLiter = 1000.obs;
  RxInt onItemClick = 1.obs;

  setWaterMeasurement({int? waterMeasurement, int? itemClick}) {
    targetWater = waterMeasurement!.obs;
    onItemClick = itemClick!.obs;
    update();
  }
   back() {
    Get.back();
  }
}
