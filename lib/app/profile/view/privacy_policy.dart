import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGreenColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                CustomWidget(
                  title: AppStrings.privacyPolicy,
                  toBack: () {
                    Get.back();
                  },
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.privacyHeading,
                        style: StyleRefer.openSansSemiBold.copyWith(fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        AppStrings.privacyDesc,
                        overflow: TextOverflow.visible,
                        style: StyleRefer.interRegular.copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.privacyDesc),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        AppStrings.privacyDesc2,
                        overflow: TextOverflow.visible,
                        style: StyleRefer.poppinsRegular.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.privacyDesc),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        AppStrings.privacyDesc,
                        overflow: TextOverflow.visible,
                        style: StyleRefer.poppinsRegular.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.privacyDesc),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        AppStrings.privacyDesc2,
                        overflow: TextOverflow.visible,
                        style: StyleRefer.poppinsRegular.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.privacyDesc),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
