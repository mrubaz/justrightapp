import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/methods.dart';
import '../../../../utils/strings.dart';
import '../../../../utils/widgets.dart';
import '../controller/addjournal_controller.dart';

class AddJustRigthJournal extends StatelessWidget {
  const AddJustRigthJournal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddJournalController());
    return Scaffold(
      backgroundColor: AppColors.darkGreenColor,
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  CustomWidget(
                    title: AppStrings.jusr1ghtJournal.toUpperCase(),
                    icon: const Icon(
                      Icons.check,
                      color: AppColors.greenColor,
                    ),
                    showCheckIcon: true,
                    toBack: () {
                      Get.back();
                    },
                    onTap: () {
                      if (!controller.formKey.currentState!.validate()) {
                        return;
                      }
                      controller.formKey.currentState!.save();
                      controller.saveFiles();
                    },
                  ),
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      Text(
                        AppStrings.min5Jornal,
                        style: StyleRefer.poppinsRegular.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        AppStrings.yourdailydiary,
                        style: StyleRefer.poppinsExtraLight.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: AppColors.checkbox),
                      )
                    ],
                  ),
                  SizedBox(height: Get.height * (0.02)),
                  const Divider(
                    color: AppColors.checkbox,
                    thickness: 2,
                  ),
                  SizedBox(height: Get.height * (0.0357)),
                  TextFormField(
                    maxLength: 30,
                    controller: controller.titleController,
                    cursorColor: AppColors.greenColor,
                    style: StyleRefer.openSansSemiBold
                        .copyWith(fontSize: 20, fontWeight: FontWeight.w800),
                    validator: (value) => textFiledValidator(value),
                    decoration: InputDecoration(
                      counterStyle:
                          const TextStyle(color: AppColors.gradientgreenColor),
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      hintText: AppStrings.title,
                      hintStyle: StyleRefer.openSansSemiBold.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * (0.0357)),
                  JournalFormFeild(
                      controller: controller.firstController,
                      validator: (value) => textFiledValidator(value),
                      hinttext: "1.${AppStrings.writeHere}"),
                  SizedBox(height: Get.height * (0.0258)),
                  JournalFormFeild(
                      controller: controller.secondController,
                      hinttext: "2.${AppStrings.writeHere}"),
                  SizedBox(height: Get.height * (0.0258)),
                  JournalFormFeild(
                      controller: controller.thirdController,
                      hinttext: "3.${AppStrings.writeHere}"),
                  SizedBox(height: Get.height * (0.0258)),
                  JournalFormFeild(
                      controller: controller.fourthController,
                      hinttext: "4.${AppStrings.writeHere}"),
                  SizedBox(height: Get.height * (0.0258)),
                  JournalFormFeild(
                      controller: controller.fifthController,
                      hinttext: "5.${AppStrings.writeHere}"),
                  SizedBox(height: Get.height * (0.09)),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.086,
                        right: Get.width * 0.086,
                        bottom: 30),
                    child: AppButton(
                        title: "Next",
                        minWidth: Get.width * 0.7,
                        onTap: () {
                          if (!controller.formKey.currentState!.validate()) {
                            return;
                          }
                          controller.formKey.currentState!.save();
                          controller.saveFiles();
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

saveMethod() {}
