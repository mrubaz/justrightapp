import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';
import '../controller/notifications_settings_controller.dart';

class NotificationSettings extends StatelessWidget {
  NotificationSettings({Key? key}) : super(key: key);

  final _controller = Get.put(NotificationsController());

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
                  title: AppStrings.notifSettings,
                  toBack: () {
                    _controller.back();
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
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.workoutReminders,
                            style: StyleRefer.poppinsRegular.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          Obx(() => SizedBox(
                              height: 24,
                              width: 40,
                              child: CupertinoSwitch(
                                trackColor: AppColors.checkbox,
                                thumbColor: _controller.isWReminder.value
                                    ? Colors.black
                                    : Colors.white,
                                onChanged: (value) {
                                  if (value) {
                                    _controller.isWReminder.value = true;
                                  } else {
                                    _controller.isWReminder.value = false;
                                  }
                                  _controller.update();
                                },
                                value: _controller.isWReminder.value,
                              )))
                        ],
                      ),
                      const SizedBox(height: 18),
                      const Divider(
                        thickness: 1,
                        color: AppColors.textFieldBorder,
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.dailyNotif,
                            style: StyleRefer.poppinsRegular.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          Obx(() => SizedBox(
                              height: 24,
                              width: 40,
                              child: CupertinoSwitch(
                                trackColor: AppColors.checkbox,
                                thumbColor: _controller.isdailyNotifi.value
                                    ? Colors.black
                                    : Colors.white,
                                onChanged: (value) {
                                  if (value) {
                                    _controller.isdailyNotifi.value = true;
                                  } else {
                                    _controller.isdailyNotifi.value = false;
                                  }
                                  _controller.update();
                                },
                                value: _controller.isdailyNotifi.value,
                              ))),
                        ],
                      ),
                      const SizedBox(height: 18),
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
