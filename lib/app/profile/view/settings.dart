import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';
import '../controller/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());
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
                  title: AppStrings.settings,
                  toBack: () {
                    controller.back();
                  },
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      const Divider(
                        thickness: 1,
                        color: AppColors.textFieldBorder,
                      ),
                      ListTile(
                          onTap: () => controller.gotoNotificationSettings(),
                          contentPadding: EdgeInsets.zero,
                          leading: Text(
                            AppStrings.notifications,
                            style: StyleRefer.poppinsRegular.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          trailing: const Icon(
                            CupertinoIcons.forward,
                            color: Colors.white,
                          )),
                      const Divider(
                        thickness: 1,
                        color: AppColors.textFieldBorder,
                      ),
                      ListTile(
                          onTap: () {},
                          contentPadding: EdgeInsets.zero,
                          leading: Text(
                            AppStrings.contactUs,
                            style: StyleRefer.poppinsRegular.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          trailing: const Icon(
                            CupertinoIcons.forward,
                            color: Colors.white,
                          )),
                      const Divider(
                        thickness: 1,
                        color: AppColors.textFieldBorder,
                      ),
                      ListTile(
                          onTap: () {},
                          contentPadding: EdgeInsets.zero,
                          leading: Text(
                            AppStrings.reportProblem,
                            style: StyleRefer.poppinsRegular.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          trailing: const Icon(
                            CupertinoIcons.forward,
                            color: Colors.white,
                          )),
                      const Divider(
                        thickness: 1,
                        color: AppColors.textFieldBorder,
                      ),
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
