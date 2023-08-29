import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../controller/chat_controller.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  final _controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      builder: (_) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(AppStrings.chat.toUpperCase(),
                    style: StyleRefer.poppinsBold.copyWith(
                      overflow: TextOverflow.clip,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(AppStrings.chatWithYourTrainer,
                    style: StyleRefer.openSansRegular.copyWith(
                      overflow: TextOverflow.clip,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    )),
              ),
              const SizedBox(
                height: 26,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => _controller.gotoConversationPage(),
                          child: Column(
                            children: [
                              Container(
                                width: Get.width,
                                height: Get.height * 0.09,
                                decoration: BoxDecoration(color: AppColors.textFieldBorder, borderRadius: BorderRadius.circular(16)),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: SizedBox(width: 54, height: 57, child: Image.asset(AssetRef.profileImage)),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('JUSTR1GHT COACH',
                                            style: StyleRefer.poppinsRegular.copyWith(
                                              overflow: TextOverflow.clip,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            )),
                                        Text('sounds great', style: StyleRefer.poppinsRegular.copyWith(overflow: TextOverflow.clip, fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.greyColor)),
                                      ],
                                    ),
                                    const Spacer(),
                                    Text('21 min ago', style: StyleRefer.poppinsRegular.copyWith(overflow: TextOverflow.clip, fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.greyColor)),
                                    const SizedBox(
                                      width: 11,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
