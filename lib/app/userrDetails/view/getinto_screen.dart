import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';
import '../controller/getintoscreen_controller.dart';

class GetIntoScreen extends StatelessWidget {
  GetIntoScreen({Key? key}) : super(key: key);
  final _controller = Get.put(GetIntoScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGreenColor,
      body: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.darkGreenColor,
                  AppColors.darkGreenColor.withOpacity(0.4),
                  Colors.transparent,
                ],
                end: const Alignment(0.0, -0.1),
                begin: const Alignment(0.0, 0.9),
              ),
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage(
                      AssetRef.welcome,
                    ))),
          ),
          Center(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    AppStrings.welcomeTo,
                    style: StyleRefer.poppinsRegular.copyWith(color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(height: Get.height * (0.0200)),
                  Text(
                    AppStrings.appName,
                    style: StyleRefer.poppinsSemiBold.copyWith(color: Colors.white, fontSize: 34),
                  ),
                  SizedBox(height: Get.height * (0.0246)),
                  Text(
                    AppStrings.achieveFitnessGoal,
                    style: StyleRefer.poppinsRegular.copyWith(color: AppColors.greyColor, fontSize: 16),
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        Flexible(
                            flex: 1,
                            child: AppButton(
                                title: AppStrings.getInto,
                                textStyle: StyleRefer.openSansRegular.copyWith(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
                                onTap: () {
                                  _controller.getInApp();
                                })),
                        const SizedBox(width: 14),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
