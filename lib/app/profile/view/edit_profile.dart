import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/adminbasecontroller.dart';
import '../../../utils/constants.dart';
import '../../../utils/methods.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';
import '../controller/editprofile_controller.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditProfileController());
    return Scaffold(
      backgroundColor: AppColors.darkGreenColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: Get.height * (0.02)),
                CustomWidget(
                  title: AppStrings.profile,
                  toBack: () {
                    Get.back();
                  },
                ),
                SizedBox(height: Get.height * (0.05)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            controller.file != null
                                ? GetBuilder<EditProfileController>(
                                    builder: (controller) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: CircleAvatar(
                                        backgroundColor: AppColors.dotsColors,
                                        radius: 60,
                                        child: Image.file(controller.file!),
                                      ),
                                    );
                                  })
                                : GetBuilder<AdminBaseController>(
                                    builder: (controller) {
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: CircleAvatar(
                                            backgroundColor:
                                                AppColors.dotsColors,
                                            radius: 60,
                                            child: Image.network(
                                              "${AdminBaseController.userData.value.urlImage}",
                                              fit: BoxFit.cover,
                                              width: 120,
                                              height: 120,
                                            )),
                                      );
                                    },
                                  ),
                            Positioned(
                              bottom: -3,
                              right: -15,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(100),
                                onTap: () => {controller.imagePickerOption()},
                                child: Container(
                                  height: 46,
                                  width: 46,
                                  decoration: BoxDecoration(
                                      color: AppColors.textFieldBorder,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: const Icon(Icons.camera_alt),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: Get.height * (0.055)),
                      const Divider(
                          thickness: 1, color: AppColors.textFieldBorder),
                      SizedBox(height: Get.height * (0.025)),
                      Text(
                        AppStrings.name,
                        style: StyleRefer.poppinsRegular.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.gradientgreenColor,
                        ),
                      ),
                      SizedBox(height: Get.height * (0.01)),
                      Form(
                        key: controller.formKey,
                        child: SizedBox(
                          child: Obx(() => TextFormField(
                                onChanged: controller.editableMethod(),
                                maxLength: 25,
                                controller: controller.editingController,
                                validator: (value) => textFiledValidator(value),
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    counterStyle: TextStyle(
                                        color: AppColors.gradientgreenColor)),
                                cursorColor: AppColors.gradientgreenColor,
                                style: const TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline),
                              )),
                        ),
                      ),
                      SizedBox(height: Get.height * (0.01)),
                      const Divider(
                          thickness: 1, color: AppColors.textFieldBorder),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: Get.width * 0.15, right: Get.width * 0.15, bottom: 30),
        child: AppButton(
          title: "Save".toUpperCase(),
          minWidth: Get.width * 0.7,
          onTap: () {
            if (!controller.formKey.currentState!.validate()) {
              return;
            }
            controller.formKey.currentState!.save();
            controller.updateUserinfo();
            Get.back();
          },
        ),
      ),
    );
  }
}
