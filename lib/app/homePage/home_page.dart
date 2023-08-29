import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../../utils/strings.dart';
import 'controller/homepage_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomepageController());
    return GetBuilder<HomepageController>(builder: (_) {
      return Scaffold(
        backgroundColor: AppColors.darkGreenColor,
        body: controller.screens(),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.greenColor,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle: StyleRefer.openSansSemiBold.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            height: 2,
          ),
          selectedLabelStyle: StyleRefer.openSansSemiBold.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 13,
              height: 2,
              color: AppColors.greenColor),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          items: [
            BottomNavigationBarItem(
                icon: controller.selectedIndex == 0
                    ? ShaderMask(
                        shaderCallback: (bounds) {
                          return const LinearGradient(
                            begin: Alignment.centerLeft,
                            colors: [
                              AppColors.greenColor,
                              AppColors.gradientgreenColor,
                            ],
                            tileMode: TileMode.clamp,
                          ).createShader(bounds);
                        },
                        child: SvgPicture.asset(
                          AssetRef.homeIcon,
                        ),
                      )
                    : SvgPicture.asset(
                        AssetRef.homeIcon,
                      ),
                label: AppStrings.homeLabel),
            BottomNavigationBarItem(
                icon: controller.selectedIndex == 1
                    ? ShaderMask(
                        shaderCallback: (bounds) {
                          return const LinearGradient(
                            begin: Alignment.centerLeft,
                            colors: [
                              AppColors.greenColor,
                              AppColors.gradientgreenColor,
                            ],
                            tileMode: TileMode.clamp,
                          ).createShader(bounds);
                        },
                        child: SvgPicture.asset(
                          AssetRef.fitnessIcon,
                        ),
                      )
                    : SvgPicture.asset(
                        AssetRef.fitnessIcon,
                      ),
                label: AppStrings.fitnessLabel),
            BottomNavigationBarItem(
                icon: controller.selectedIndex == 2
                    ? ShaderMask(
                        shaderCallback: (bounds) {
                          return const LinearGradient(
                            begin: Alignment.centerLeft,
                            colors: [
                              AppColors.greenColor,
                              AppColors.gradientgreenColor,
                            ],
                            tileMode: TileMode.clamp,
                          ).createShader(bounds);
                        },
                        child: SvgPicture.asset(
                          AssetRef.nutrationIcon,
                        ),
                      )
                    : SvgPicture.asset(
                        AssetRef.nutrationIcon,
                      ),
                label: AppStrings.nutritionLabel),
            BottomNavigationBarItem(
                icon: controller.selectedIndex == 3
                    ? ShaderMask(
                        shaderCallback: (bounds) {
                          return const LinearGradient(
                            begin: Alignment.centerLeft,
                            colors: [
                              AppColors.greenColor,
                              AppColors.gradientgreenColor,
                            ],
                            tileMode: TileMode.clamp,
                          ).createShader(bounds);
                        },
                        child: SvgPicture.asset(
                          AssetRef.fitMindIcon,
                        ),
                      )
                    : SvgPicture.asset(
                        AssetRef.fitMindIcon,
                      ),
                label: AppStrings.mindSetLabel),
            BottomNavigationBarItem(
                icon: controller.selectedIndex == 4
                    ? ShaderMask(
                        shaderCallback: (bounds) {
                          return const LinearGradient(
                            begin: Alignment.centerLeft,
                            colors: [
                              AppColors.greenColor,
                              AppColors.gradientgreenColor,
                            ],
                            tileMode: TileMode.clamp,
                          ).createShader(bounds);
                        },
                        child: SvgPicture.asset(
                          AssetRef.chatIcon,
                        ),
                      )
                    : SvgPicture.asset(
                        AssetRef.chatIcon,
                      ),
                label: AppStrings.chat),
          ],
          currentIndex: controller.selectedIndex,
          onTap: (value) {
            controller.onTap(value: value);
          },
        ),
      );
    });
  }
}
