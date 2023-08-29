import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
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
                    toBack: () {
                      Get.back();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: Get.height * 0.035),
                        Text(AppStrings.forgotPassword.toUpperCase(),
                            style: StyleRefer.integralRegular.copyWith(
                              overflow: TextOverflow.clip,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            )),
                        SizedBox(height: Get.height * 0.019),
                        Text(AppStrings.signUpToDummy.toUpperCase(),
                            style: StyleRefer.integralRegular.copyWith(
                                overflow: TextOverflow.clip,
                                fontSize: 10,
                                fontWeight: FontWeight.w400)),
                        SizedBox(
                          height: Get.height * 0.06,
                        ),
                        Form(
                          child: Column(
                            children: [
                              const CustomTextFormField(
                                  hintText: AppStrings.email,
                                  obScureText: false),
                              SizedBox(height: Get.height * 0.18),
                              AppButton(
                                title: AppStrings.send,
                                onTap: () {},
                                minWidth: Get.width * 0.7,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
