import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/adminbasecontroller.dart';
import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';
import '../controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final _controller = Get.put(ProfileController());
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
                  title: AppStrings.profile.toUpperCase(),
                  toBack: () {
                    Get.back();
                  },
                ),
                const SizedBox(height: 37),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetBuilder<AdminBaseController>(
                        builder: (controller) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: CircleAvatar(
                              backgroundColor: AppColors.dotsColors,
                              radius: 50,
                              child:
                                  AdminBaseController.userData.value.urlImage !=
                                          null
                                      ? Image.network(
                                          "${AdminBaseController.userData.value.urlImage}",
                                          fit: BoxFit.cover,
                                          height: 100,
                                          width: 100,
                                        )
                                      : const Icon(
                                          Icons.person_rounded,
                                          size: 70,
                                          color: AppColors.textFieldBorder,
                                        ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      GetBuilder<AdminBaseController>(
                        // init: _con
                        builder: (controller) {
                          return Text(
                            AdminBaseController.userData.value.userName ?? "",
                            overflow: TextOverflow.visible,
                            style: StyleRefer.poppinsBold.copyWith(
                                fontSize: 32, fontWeight: FontWeight.w700),
                          );
                        },
                      ),
                      SizedBox(height: Get.height * (0.0246)),
                      GestureDetector(
                        onTap: () => _controller.gotoSettings(),
                        child: Text(
                          AppStrings.settings,
                          style: StyleRefer.poppinsRegular.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Divider(
                        thickness: 1,
                        color: AppColors.textFieldBorder,
                      ),
                      ListTile(
                          onTap: () {
                            _controller.gotoEditProfile();
                          },
                          contentPadding: EdgeInsets.zero,
                          leading: Text(
                            AppStrings.editProfile,
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
                          onTap: () {
                            _controller.gotoGenderScreen();
                          },
                          contentPadding: EdgeInsets.zero,
                          leading: Text(
                            AppStrings.editInfo,
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
                          onTap: () => _controller.gotoPrivacy(),
                          contentPadding: EdgeInsets.zero,
                          leading: Text(
                            AppStrings.privacyPolicy,
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
                          onTap: () => _controller.gotoSettings(),
                          contentPadding: EdgeInsets.zero,
                          leading: Text(
                            AppStrings.advanceSettings,
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
                      SizedBox(height: Get.height * (0.1711)),
                      const Divider(
                        thickness: 1,
                        color: AppColors.textFieldBorder,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _controller.signOut();
                        },
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                        ),
                        child: Text(
                          AppStrings.signOut,
                          style: StyleRefer.openSansSemiBold.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: AppColors.redButton),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        color: AppColors.textFieldBorder,
                      ),
                      const SizedBox(height: 44),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
