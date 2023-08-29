import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';
import '../controller/event_details_controller.dart';

class EVentDetailScreen extends StatelessWidget {
  EVentDetailScreen({Key? key}) : super(key: key);

  final _controller = Get.put(EventDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGreenColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          AppStrings.evevtDetailsTitle,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                height: 3,
                width: 36,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white.withOpacity(0.3)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    AssetRef.flagEvent,
                    color: Colors.white,
                  ),
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  height: Get.height * 0.3,
                  width: Get.width,
                  child: Image.asset(
                    AssetRef.eventDetails,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: -30,
                  child: EventDetailsStackWidget(onPressed: () {}, numberOfPeople: '20', imagesList: _controller.imagesList),
                )
              ],
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  AppStrings.joinSquatsChallenge,
                  overflow: TextOverflow.visible,
                  style: StyleRefer.poppinsRegular.copyWith(fontSize: 35, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(color: AppColors.eventCalender, borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.75, vertical: 11.5),
                          child: SvgPicture.asset(
                            AssetRef.eventCalendar,
                            color: AppColors.greenColor,
                          )),
                    ),
                    const SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '20 JUNE, 2022',
                          overflow: TextOverflow.visible,
                          style: StyleRefer.poppinsRegular.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Tuesday, 4:00PM - 9:00PM',
                          overflow: TextOverflow.visible,
                          style: StyleRefer.poppinsRegular.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.eventTextDark),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 18),
                const Text(
                  AppStrings.aboutEvent,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  AppStrings.enjoyYourFavourite,
                  overflow: TextOverflow.visible,
                  style: StyleRefer.poppinsRegular.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 180,
        width: Get.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, tileMode: TileMode.clamp, colors: [
          Colors.black,
          Colors.transparent
        ])),
        child: Padding(
          padding: EdgeInsets.only(left: Get.width * 0.15, right: Get.width * 0.15, bottom: 54, top: 77),
          child: AppButton(
            title: AppStrings.joinEvent,
            minWidth: Get.width * 0.7,
            onTap: () => _controller.gotoWakeUp(),
          ),
        ),
      ),
    );
  }
}
