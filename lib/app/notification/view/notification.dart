import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../models/notification_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';
import '../controller/newnotification_controller.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewNotificationController());
    return Scaffold(
      backgroundColor: AppColors.darkGreenColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomWidget(
                    title: AppStrings.notification,
                    toBack: () {
                      controller.back();
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Obx(
              () => Expanded(
                child: ListView.builder(
                  itemCount: controller.items.length,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    NotificationModel notificationDat = controller.items[index];
                    return slideableWidegt(index, notificationDat);
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Slidable slideableWidegt(int index, NotificationModel notificationDat) {
    return Slidable(
      key: Key(index.toString()),
      groupTag: index,
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            label: "Delete",
            backgroundColor: AppColors.redButton,
            icon: Icons.delete,
            onPressed: (context) {
              deleteMsgDialog(context, index);
            },
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Divider(color: AppColors.dotsColors, thickness: 1),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(notificationDat.title,
                          style:
                              StyleRefer.poppinsMedium.copyWith(fontSize: 15)),
                      const Spacer(),
                      Text(notificationDat.date,
                          style:
                              StyleRefer.poppinsMedium.copyWith(fontSize: 16)),
                    ],
                  ),
                  Text(notificationDat.desc,
                      style: StyleRefer.poppinsMedium.copyWith(fontSize: 16)),
                ],
              ),
            ),
            const Divider(color: AppColors.dotsColors, thickness: 1),
          ],
        ),
      ),
    );
  }
}

Future<dynamic> deleteMsgDialog(BuildContext context, int index) {
  final controller = Get.put(NewNotificationController());
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: AppColors.darkGreenColor,
      content: Text(
        AppStrings.popupmsg,
        style: StyleRefer.poppinsMedium
            .copyWith(fontSize: 16, overflow: TextOverflow.clip),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            AppStrings.cancel,
            style: StyleRefer.poppinsMedium
                .copyWith(fontSize: 16, overflow: TextOverflow.clip),
          ),
        ),
        TextButton(
          onPressed: () => controller.deleteMessage(index),
          child: Text(
            AppStrings.delete,
            style: StyleRefer.poppinsMedium
                .copyWith(fontSize: 16, overflow: TextOverflow.clip),
          ),
        ),
      ],
    ),
  );
}
