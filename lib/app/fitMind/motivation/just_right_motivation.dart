import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/quote_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';
import 'just_right_motivation_controller.dart';

class JustRightMotivation extends StatelessWidget {
  const JustRightMotivation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MotivationController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomWidget(
            title: AppStrings.jusr1ghtMotivation.toUpperCase(),
            toBack: () {
              Get.back();
            },
          ),
        ),
      ),
      backgroundColor: AppColors.darkGreenColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GetBuilder<MotivationController>(
            builder: (MotivationController controller) {
              return controller.qoutesList.isNotEmpty
                  ? PageView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const ScrollPhysics(),
                      itemCount: controller.qoutesList.length,
                      itemBuilder: (context, index) {
                        Quotes quotes = controller.qoutesList[index];
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                textScaleFactor: 0.8,
                                quotes.q,
                                overflow: TextOverflow.visible,
                                style: StyleRefer.openSansRegular.copyWith(
                                    fontSize: 20,
                                    color: AppColors.quoteText,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.italic),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                quotes.a,
                                style: StyleRefer.openSansRegular.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
