import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';
import '../controller/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  final _controller = Get.put(OnBoardingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF1C1C1E),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView.builder(
                  controller: _controller.pageController,
                  onPageChanged: _controller.selectedPageIndex,
                  itemCount: _controller.onBoarding.length,
                  itemBuilder: (context, index) {
                    var data = _controller.onBoarding[index];
                    return Column(
                      children: [
                        SizedBox(
                          width: Get.width,
                          height: Get.height * 0.6,
                          child: Image.asset(
                            data.imageAsset ?? '',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(height: Get.size.height * 0.005),
                                    Text(
                                      data.title?.toUpperCase() ?? '',
                                      textAlign: TextAlign.center,
                                      style:
                                          StyleRefer.integralRegular.copyWith(
                                        fontSize: 24,
                                        color: Colors.white,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                    const SizedBox(height: 21),
                                    Obx(
                                      () => _controller
                                                  .selectedPageIndex.value ==
                                              2
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 50, right: 50, top: 50),
                                              child: AppButton(
                                                  title: AppStrings.getStarted,
                                                  onTap: () async {
                                                    SharedPreferences prefs =
                                                        await SharedPreferences
                                                            .getInstance();
                                                    await prefs.setInt(
                                                        "initScreen", 1);
                                                    _controller.forwardAction();
                                                  }),
                                            )
                                          : Text(
                                              data.description ?? '',
                                              textAlign: TextAlign.center,
                                              style: StyleRefer.poppinsRegular
                                                  .copyWith(
                                                      color:
                                                          AppColors.greyColor,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      fontSize: 16),
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _controller.onBoarding.length,
                        (index) => Obx(() {
                          return Container(
                            margin: const EdgeInsets.all(4),
                            width: _controller.selectedPageIndex.value == index
                                ? 40
                                : 16,
                            height: 5,
                            decoration: BoxDecoration(
                                color:
                                    _controller.selectedPageIndex.value == index
                                        ? AppColors.greenColor
                                        : AppColors.dotsColors,
                                borderRadius: BorderRadius.circular(0)),
                          );
                        }),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
