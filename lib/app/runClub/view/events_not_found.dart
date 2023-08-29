import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/strings.dart';

class NoEventsScreen extends StatelessWidget {
  const NoEventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
            child: Stack(
              children: [
                Container(
                  height: Get.width * 0.429,
                  width: Get.width * 0.429,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: AppColors.eventCircle),
                ),
                Positioned(
                  bottom: -2,
                  right: 3,
                  child: Image.asset(
                    AssetRef.events,
                    height: Get.width * 0.34,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Text(
            AppStrings.noUpcomingEvent,
            style: StyleRefer.poppinsRegular.copyWith(fontSize: 24, fontWeight: FontWeight.w400, color: AppColors.eventTextLight),
          ),
          Text(
            AppStrings.dummyNoUpcoming,
            textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
            style: StyleRefer.poppinsRegular.copyWith(fontSize: 17, fontWeight: FontWeight.w400, color: AppColors.eventTextDark),
          ),
        ],
      ),
    );
  }
}
