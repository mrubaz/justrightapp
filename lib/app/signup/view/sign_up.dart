import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/methods.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';
import '../controller/signup_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final _controller = Get.put(SignupController());
  final _formkey = GlobalKey<FormState>();

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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: Get.height * 0.035),
                          Text(AppStrings.signUpTo.toUpperCase(),
                              style: StyleRefer.integralRegular.copyWith(
                                overflow: TextOverflow.clip,
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                              )),
                          SizedBox(height: Get.height * 0.014),
                          Text(AppStrings.signUpToDummy.toUpperCase(),
                              style: StyleRefer.integralRegular.copyWith(
                                  overflow: TextOverflow.clip,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400)),
                          SizedBox(
                            height: Get.height * 0.044,
                          ),
                          Form(
                              key: _formkey,
                              child: Column(
                                children: [
                                  CustomTextFormField(
                                      controller: _controller.userName,
                                      validator: (val) => nameValidation(val),
                                      hintText: AppStrings.fName,
                                      obScureText: false),
                                  SizedBox(
                                    height: Get.height * 0.04,
                                  ),
                                  CustomTextFormField(
                                      controller: _controller.email,
                                      keyboardType: TextInputType.emailAddress,
                                      hintText: AppStrings.email,
                                      validator: (val) =>
                                          emailValidationwhole(val),
                                      obScureText: false),
                                  SizedBox(
                                    height: Get.height * 0.04,
                                  ),
                                  CustomTextFormField(
                                      controller: _controller.password,
                                      validator: (val) => validatePassword(val),
                                      hintText: AppStrings.password,
                                      obScureText: true),
                                  SizedBox(
                                    height: Get.height * 0.04,
                                  ),
                                  CustomTextFormField(
                                      controller: _controller.confirmPass,
                                      validator: (val) =>
                                          val != _controller.password.text
                                              ? AppStrings.enterSamePass
                                              : null,
                                      hintText: AppStrings.confirmPasswrod,
                                      obScureText: true),
                                  SizedBox(
                                    height: Get.height * 0.04,
                                  ),
                                  AppButton(
                                    title: AppStrings.signUp,
                                    onTap: () {
                                      FocusManager.instance.primaryFocus!
                                          .unfocus();
                                      _controller.signUpwithFirebase(
                                          _controller.email.text,
                                          _controller.password.text,
                                          _controller.userName.text,
                                          _formkey);
                                    },
                                    minWidth: Get.width * 0.7,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ))
                        ]),
                  ),
                  SizedBox(height: Get.height * 0.044),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: Get.width * 0.27,
                        height: 0.5,
                        color: AppColors.greyColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        AppStrings.orSignUp,
                        style: StyleRefer.interRegular.copyWith(
                            fontWeight: FontWeight.w400, fontSize: 12),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: Get.width * 0.27,
                        height: 0.5,
                        color: AppColors.greyColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.048,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialIconWidget(
                        onPressed: () {
                          _controller.signUpFacebook();
                        },
                        iconRef: AssetRef.fbIcon,
                      ),
                      const SizedBox(width: 20),
                      SocialIconWidget(
                        onPressed: () {
                          _controller.signUpWithGoogleSign();
                        },
                        iconRef: AssetRef.googleIcon,
                      ),
                      const SizedBox(width: 20),
                      SocialIconWidget(
                        onPressed: () {},
                        iconRef: AssetRef.iosIcon,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () => _controller.gotoLogin(),
                  child: Row(
                    children: [
                      Text(
                        AppStrings.alreadyAccount,
                        style: StyleRefer.interRegular.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColors.alreadyAccountColor,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(AppStrings.loginNow,
                          style: StyleRefer.interRegular.copyWith(
                            color: AppColors.greenColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
