import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';
import '../controller/conversation_controller.dart';

class ConversationPage extends StatelessWidget {
  ConversationPage({Key? key}) : super(key: key);

  final _controller = Get.put(ConversationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConversationController>(
      builder: (_) {
        return SafeArea(
            child: Scaffold(
          backgroundColor: AppColors.darkGreenColor,
          body: Column(
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: CustomWidget(
                  title: AppStrings.chat,
                  icon: const Icon(
                    Icons.check,
                    color: AppColors.greenColor,
                  ),
                  showCheckIcon: false,
                  toBack: () {
                    _controller.back();
                  },
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: _controller.messages.length,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                      child: Column(
                        children: [
                          //*********** Showing time
                          if (_controller.messages.length - 1 == index)
                            Text('Today',
                                style: StyleRefer.poppinsRegular.copyWith(
                                  overflow: TextOverflow.clip,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                )),

                          const SizedBox(
                            height: 8,
                          ),

                          //*********** Showing message

                          _controller.messages[index].senderId == 'sender' ? sender(context, index) : receiver(context, index),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 35),
                child: TextField(
                  maxLines: 6,
                  minLines: 1,
                  // controller: messageController,
                  style: const TextStyle(color: Colors.black),
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    fillColor: AppColors.checkbox,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Type your message...',
                    hintStyle: StyleRefer.poppinsRegular.copyWith(
                      overflow: TextOverflow.clip,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: IconButton(
                      icon: SvgPicture.asset(AssetRef.attachment),
                      onPressed: () {},
                    ),
                    suffixIcon: IconButton(
                      icon: SvgPicture.asset(AssetRef.send),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
      },
    );
  }

  Align sender(BuildContext context, int index) {
    return Align(
      alignment: Alignment.topRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SelectableText('12:31 am',
              style: StyleRefer.poppinsRegular.copyWith(
                overflow: TextOverflow.clip,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              )),
          const SizedBox(
            height: 8,
          ),
          Container(
              constraints: BoxConstraints(minWidth: 50, maxWidth: MediaQuery.of(context).size.width * .8),
              decoration: const BoxDecoration(
                  color: AppColors.greenColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: SelectableText(_controller.messages[index].message.toString(),
                    style: StyleRefer.poppinsRegular.copyWith(
                      overflow: TextOverflow.clip,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    )),
              )),
        ],
      ),
    );
  }

  Align receiver(BuildContext context, int index) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText('12:31 am',
              style: StyleRefer.poppinsRegular.copyWith(
                overflow: TextOverflow.clip,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              )),
          const SizedBox(
            height: 8,
          ),
          Container(
              constraints: BoxConstraints(minWidth: 50, maxWidth: MediaQuery.of(context).size.width * .8),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: SelectableText(_controller.messages[index].message.toString(), style: StyleRefer.poppinsRegular.copyWith(overflow: TextOverflow.clip, fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.greyColor)),
              )),
        ],
      ),
    );
  }
}
