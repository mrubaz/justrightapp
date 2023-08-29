import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/methods.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _controller = Get.put(LoginController());
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
                          Text(AppStrings.loginText.toUpperCase(),
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
                                      controller: _controller.email,
                                      validator: (val) =>
                                          emailValidationwhole(val),
                                      hintText: AppStrings.email,
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
                                    height: Get.height * 0.01,
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: TextButton(
                                        onPressed: () =>
                                            _controller.gotoForgetPass(),
                                        child: Text(
                                          AppStrings.forgetPass,
                                          style: StyleRefer.interRegular
                                              .copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.lightText),
                                        )),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.01,
                                  ),
                                  AppButton(
                                    title: AppStrings.logIn,
                                    onTap: () {
                                      _controller.loginfirebase(
                                          _controller.email.text,
                                          _controller.password.text,
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
                  SizedBox(
                    height: Get.height * 0.044,
                  ),
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
                        AppStrings.orLogin,
                        style: StyleRefer.interRegular.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
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
                          _controller.loginWithFacebook();
                        },
                        iconRef: AssetRef.fbIcon,
                      ),
                      const SizedBox(width: 20),
                      SocialIconWidget(
                        onPressed: () {
                          _controller.loginWithGoogle();
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
                  onPressed: () => _controller.gotoSignup(),
                  child: Row(
                    children: [
                      Text(
                        AppStrings.dontHaveAccount,
                        style: StyleRefer.interRegular.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColors.alreadyAccountColor,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(AppStrings.signUpNow,
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
