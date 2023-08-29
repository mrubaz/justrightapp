import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'constants.dart';
import 'strings.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final double? minWidth;
  final double? fontSize;
  final TextStyle? textStyle;
  final FontWeight? fontWeight;

  final VoidCallback? onTap;
  final Color? color;
  const AppButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.color,
      this.titleColor,
      this.minWidth,
      this.fontSize,
      this.fontWeight,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      minWidth: minWidth ?? MediaQuery.of(context).size.width,
      height: 50,
      color: color ?? AppColors.greenColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        title,
        style: textStyle ??
            StyleRefer.openSansSemiBold.copyWith(
                fontSize: fontSize ?? 17,
                fontWeight: fontWeight ?? FontWeight.w600,
                color: titleColor ?? Colors.white),
      ),
    );
  }
}

class AppButtonBorder extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final double? minWidth;
  final VoidCallback? onTap;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const AppButtonBorder({
    Key? key,
    required this.title,
    required this.onTap,
    this.color,
    this.titleColor,
    this.minWidth,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(10)),
      child: MaterialButton(
        onPressed: onTap,
        elevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        minWidth: minWidth ?? MediaQuery.of(context).size.width,
        height: 50,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(
          title,
          style: StyleRefer.poppinsBold.copyWith(
              fontSize: fontSize ?? 16,
              fontWeight: fontWeight ?? FontWeight.w500,
              color: titleColor ?? Colors.white),
        ),
      ),
    );
  }
}

class CustomWidget extends StatelessWidget {
  final String? title;
  final bool? showAddAction;
  final bool? showCheckIcon;
  final Color? customColor;
  final Icon? icon;
  final void Function() toBack;
  final Function()? onTap;

  const CustomWidget(
      {Key? key,
      this.title,
      this.showAddAction,
      this.customColor,
      this.icon,
      this.showCheckIcon,
      required this.toBack,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: customColor ?? AppColors.darkGreenColor,
      elevation: 0,
      leadingWidth: 32,
      toolbarHeight: 32,
      leading: Container(
        decoration: BoxDecoration(
            color: AppColors.dotsColors,
            borderRadius: BorderRadius.circular(16)),
        child: IconButton(
            splashRadius: 16,
            icon: const Icon(
              CupertinoIcons.back,
              size: 13,
              color: Colors.white,
            ),
            onPressed: toBack),
      ),
      title: Text(
        title ?? '',
        style: StyleRefer.poppinsSemiBold
            .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      centerTitle: true,
      actions: [
        Visibility(
          visible: showCheckIcon == true ? true : false,
          child: GestureDetector(onTap: onTap, child: icon ?? const Offstage()),
        ),
        GestureDetector(
          onTap: onTap,
          child: Visibility(
            visible: showAddAction == true ? true : false,
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.greenColor,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextInputType? keyboardType;
  final bool obScureText;

  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final TextEditingController? controller;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.obScureText,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      obscureText: obScureText,
      keyboardType: keyboardType,
      cursorColor: AppColors.greenColor,
      style: StyleRefer.poppinsRegular.copyWith(
        fontSize: 17,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: Get.width * 0.042),
          enabledBorder: const UnderlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.textFieldBorder, width: 1)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.greenColor, width: 1)),
          hintText: hintText,
          hintStyle: StyleRefer.openSansRegular.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.w400,
          )),
    );
  }
}

class SocialIconWidget extends StatelessWidget {
  final String iconRef;

  final double radius;
  final VoidCallback onPressed;

  const SocialIconWidget({
    Key? key,
    required this.iconRef,
    this.radius = 15,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          height: 63,
          width: 63,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(color: AppColors.borderColor, width: 1)),
          child: MaterialButton(
              onPressed: onPressed, child: SvgPicture.asset(iconRef)),
        ),
      ),
    );
  }
}

class GenderWidget extends StatelessWidget {
  const GenderWidget(
      {Key? key,
      required this.femaleColor,
      required this.icon,
      required this.title,
      required this.onTap})
      : super(key: key);

  final bool femaleColor;
  final String title;
  final String icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 140,
      decoration: BoxDecoration(
        color: femaleColor == true
            ? AppColors.greenColor
            : AppColors.textFieldBorder,
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: MaterialButton(
          onPressed: () {
            onTap();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height * 0.012,
              ),
              Image.asset(
                icon,
                height: 48,
              ),
              SizedBox(
                height: Get.height * 0.018,
              ),
              Text(
                title,
                style: StyleRefer.poppinsRegular
                    .copyWith(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCheckBoxTile extends StatelessWidget {
  const CustomCheckBoxTile({
    Key? key,
    required this.onTapCheckBox,
    required this.titleCheckBox,
    this.isChecked,
    this.checkSize,
    this.isInJournal = false,
  }) : super(key: key);

  final VoidCallback onTapCheckBox;
  final String titleCheckBox;
  final bool? isChecked;
  final bool? isInJournal;
  final double? checkSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCheckBox,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: checkSize ?? 16,
            width: checkSize ?? 16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: AppColors.checkbox,
            ),
          ),
          SizedBox(width: Get.width * 0.022),
          Expanded(
            child: Text(
              titleCheckBox,
              textAlign: TextAlign.start,
              style: StyleRefer.poppinsMedium
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}

class CustomRoutineCard extends StatelessWidget {
  final String imageRef;

  final String titleText;

  final String subTitle;
  final VoidCallback onTap;

  const CustomRoutineCard({
    Key? key,
    required this.imageRef,
    required this.titleText,
    required this.subTitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(children: [
        Container(
          height: Get.height * 0.2,
          width: Get.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                  image: AssetImage(imageRef), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  titleText,
                  style: StyleRefer.poppinsSemiBold
                      .copyWith(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      "|",
                      style: StyleRefer.poppinsBold.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greenColor,
                      ),
                    ),
                    const SizedBox(width: 4.5),
                    Text(
                      subTitle,
                      style: StyleRefer.poppinsMedium.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greenColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          height: Get.height * 0.2,
          width: Get.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                  image: AssetImage(imageRef), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  titleText,
                  style: StyleRefer.poppinsSemiBold
                      .copyWith(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      "|",
                      style: StyleRefer.poppinsBold.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greenColor,
                      ),
                    ),
                    const SizedBox(width: 4.5),
                    Text(
                      subTitle,
                      style: StyleRefer.poppinsMedium.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greenColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class TabbarWidget extends StatelessWidget {
  final String firstTab;

  final String secondTab;

  final String thirdTab;

  const TabbarWidget({
    Key? key,
    required this.firstTab,
    required this.secondTab,
    required this.thirdTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: Get.width,
      decoration: BoxDecoration(
          color: AppColors.textFieldBorder,
          borderRadius: BorderRadius.circular(32.0)),
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(50),
        child: TabBar(
          indicatorPadding: const EdgeInsets.all(0),
          splashBorderRadius: BorderRadius.circular(32),
          labelPadding: const EdgeInsets.all(0),
          padding: EdgeInsets.zero,
          labelStyle: StyleRefer.openSansRegular
              .copyWith(fontSize: 13, fontWeight: FontWeight.w400),
          indicator: BoxDecoration(
              color: AppColors.greenColor,
              borderRadius: BorderRadius.circular(32.0)),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
          tabs: [
            Tab(
              text: firstTab,
            ),
            Tab(
              text: secondTab,
            ),
            Tab(
              text: thirdTab,
            ),
          ],
        ),
      ),
    );
  }
}

class TwoTabsTabbarWidget extends StatelessWidget {
  final String firstTab;
  final String secondTab;

  const TwoTabsTabbarWidget({
    Key? key,
    required this.firstTab,
    required this.secondTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: Get.width,
      decoration: BoxDecoration(
          color: AppColors.textFieldBorder,
          borderRadius: BorderRadius.circular(32.0)),
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(50),
        child: TabBar(
          indicatorPadding: const EdgeInsets.all(0),
          splashBorderRadius: BorderRadius.circular(32),
          labelPadding: const EdgeInsets.all(0),
          padding: EdgeInsets.zero,
          labelStyle: StyleRefer.openSansRegular.copyWith(fontSize: 13),
          indicator: BoxDecoration(
              color: AppColors.greenColor,
              borderRadius: BorderRadius.circular(32.0)),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
          tabs: [
            Tab(
              text: firstTab,
            ),
            Tab(
              text: secondTab,
            ),
          ],
        ),
      ),
    );
  }
}

class LeaderBoardWidget extends StatelessWidget {
  final String date;
  final String steps;
  final String stepsDuration;

  const LeaderBoardWidget({
    Key? key,
    required this.date,
    required this.steps,
    required this.stepsDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 11),
      // height: Get.height * 0.162,
      width: (Get.width * 0.5) - 17,
      height: 143,
      decoration: BoxDecoration(
          color: AppColors.textFieldBorder,
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            // overflow: TextOverflow.ellipsis,
            style: StyleRefer.openSansRegular
                .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                steps,
                style: StyleRefer.openSansRegular.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                stepsDuration,
                style: StyleRefer.openSansRegular.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Text(
            'Avg. 4.19 km',
            style: StyleRefer.openSansRegular.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          SvgPicture.asset(AssetRef.runPersonIcon),
        ],
      ),
    );
  }
}

class ListTileChallengesTab extends StatelessWidget {
  final String text;

  final String tileIcon;

  final String subText;

  final bool isChecked;

  const ListTileChallengesTab({
    Key? key,
    required this.text,
    required this.tileIcon,
    required this.subText,
    required this.onTapCheckBox,
    required this.isChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12, right: 26),
      height: 81,
      decoration: BoxDecoration(
        color: AppColors.textFieldBorder,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
              height: 57,
              width: 54,
              decoration: BoxDecoration(
                  color: AppColors.greenColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
                child: SvgPicture.asset(
                  tileIcon,
                  color: Colors.white,
                ),
              )),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: StyleRefer.poppinsRegular
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Text(
                subText,
                style: StyleRefer.poppinsRegular.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.checkbox),
              ),
            ],
          ),
          const Spacer(),
          InkWell(
              onTap: onTapCheckBox,
              child: isChecked
                  ? Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: AppColors.greenColor,
                          borderRadius: BorderRadius.circular(6)),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset(
                          AssetRef.checkPng,
                          color: Colors.black,
                        ),
                      ),
                    )
                  : Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          // color: AppColors.gradientgreenColor,
                          border: Border.all(color: Colors.white, width: 1.5),
                          borderRadius: BorderRadius.circular(6)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.asset(
                          AssetRef.arrowRight,
                        ),
                      ),
                    ))
        ],
      ),
    );
  }

  final VoidCallback onTapCheckBox;
}

class EventsCardWidget extends StatelessWidget {
  final String membersNumber;

  final String date;

  final String month;

  final String title;

  final String bgImage;

  final List<String> imagesList;

  const EventsCardWidget({
    Key? key,
    required this.membersNumber,
    required this.date,
    required this.month,
    required this.title,
    required this.bgImage,
    required this.imagesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 10, top: 14),
          height: 170,
          width: Get.width,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              image: DecorationImage(
                  image: AssetImage(bgImage), fit: BoxFit.cover)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: Get.width * 0.12,
                width: Get.width * 0.12,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.7)),
                child: Column(
                  children: [
                    Text(
                      date,
                      style: StyleRefer.poppinsSemiBold.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    Text(
                      month,
                      style: StyleRefer.poppinsSemiBold.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
              Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white.withOpacity(0.7)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      AssetRef.flagEvent,
                      color: AppColors.greenColor,
                    ),
                  ))
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          height: 50,
          width: Get.width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16)),
            color: AppColors.textFieldBorder,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: StyleRefer.openSansRegular
                    .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  buldStackedImages(imagesList),
                  const SizedBox(width: 7),
                  Text(
                    '+$membersNumber ${AppStrings.going}',
                    style: StyleRefer.poppinsSemiBold.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.eventTextLight),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buldStackedImages(List<String> imagesList) {
    const double size = 24;
    final urlImages = imagesList;

    final items = urlImages.map((urlImage) => buildImage(urlImage)).toList();
    return StackedWidgets(
      items: items,
      size: size,
    );
  }

  Widget buildImage(String urlImage) {
    return ClipOval(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(1),
        child: ClipOval(
          clipBehavior: Clip.hardEdge,
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.network(
              urlImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class StackedWidgets extends StatelessWidget {
  final List<Widget> items;
  final double size;

  final direction = TextDirection.ltr;
  const StackedWidgets({Key? key, required this.items, this.size = 24})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allItems = items
        .asMap()
        .map((index, item) {
          final left = size - 8;
          final value = Container(
            width: size,
            height: size,
            margin: EdgeInsets.only(left: left * index),
            child: item,
          );

          return MapEntry(index, value);
        })
        .values
        .toList();

    return Stack(
      children: direction == TextDirection.ltr
          ? allItems.reversed.toList()
          : allItems,
    );
  }
}

class EventDetailsStackWidget extends StatelessWidget {
  final String numberOfPeople;
  final List<String> imagesList;

  const EventDetailsStackWidget({
    Key? key,
    required this.numberOfPeople,
    required this.imagesList,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      height: 60,
      width: Get.width - 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.textFieldBorder,
      ),
      child: Row(
        children: [
          buldEventDetailsStackedImages(imagesList),
          const SizedBox(width: 10),
          Text(
            '+$numberOfPeople ${AppStrings.going}',
            style: StyleRefer.poppinsRegular.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          MaterialButton(
              color: AppColors.greenColor,
              height: 28,
              minWidth: 67,
              onPressed: onPressed,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7)),
              child: Text(
                AppStrings.invite,
                style: StyleRefer.poppinsRegular.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textFieldBorder),
              ))
        ],
      ),
    );
  }

  final VoidCallback onPressed;

  Widget buldEventDetailsStackedImages(List<String> imagesList) {
    const double size = 34;
    final urlImages = imagesList;

    final items = urlImages.map((urlImage) => buildImage(urlImage)).toList();
    return StackedWidgets(
      items: items,
      size: size,
    );
  }

  Widget buildImage(String urlImage) {
    return ClipOval(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(1),
        child: ClipOval(
          clipBehavior: Clip.hardEdge,
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.network(
              urlImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class ListTileWakeUpCall extends StatelessWidget {
  final String text;

  final String tileIcon;

  final String subText;

  final bool isChecked;

  const ListTileWakeUpCall({
    Key? key,
    required this.text,
    required this.tileIcon,
    required this.subText,
    required this.onTapCheckBox,
    required this.isChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Get.width * (0.032),
        top: Get.height * (0.0123),
        bottom: Get.height * (0.0098),
        right: Get.width * (0.064),
      ),
      decoration: BoxDecoration(
        color: AppColors.textFieldBorder,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
              height: Get.height * (0.0701),
              width: Get.width * (0.144),
              decoration: BoxDecoration(
                  color: AppColors.greenColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
                child: SvgPicture.asset(
                  tileIcon,
                  color: Colors.white,
                ),
              )),
          SizedBox(width: Get.width * (0.0426)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: StyleRefer.poppinsMedium
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                subText,
                style: StyleRefer.poppinsMedium
                    .copyWith(fontSize: 14, color: AppColors.checkbox),
              ),
            ],
          ),
          const Spacer(),
          InkWell(
              onTap: onTapCheckBox,
              child: isChecked
                  ? Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: AppColors.greenColor,
                          borderRadius: BorderRadius.circular(6)),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset(
                          AssetRef.checkPng,
                          color: Colors.black,
                        ),
                      ),
                    )
                  : Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          // color: AppColors.gradientgreenColor,
                          border: Border.all(color: Colors.white, width: 1.5),
                          borderRadius: BorderRadius.circular(6)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.asset(
                          AssetRef.arrowRight,
                        ),
                      ),
                    ))
        ],
      ),
    );
  }

  final VoidCallback onTapCheckBox;
}

class WorkoutSetsWidget extends StatelessWidget {
  final String? text;

  final String? imageRef;

  final String? duration;
  final bool isNetwork;

  const WorkoutSetsWidget({
    Key? key,
    required this.text,
    required this.imageRef,
    required this.duration,
    this.isNetwork = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: isNetwork == false
              ? Image.asset(
                  imageRef ?? "",
                  fit: BoxFit.fill,
                )
              : Image.network(
                  imageRef ?? "",
                  fit: BoxFit.fill,
                ),
        ),
        SizedBox(width: Get.width * (0.0266)),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                overflow: TextOverflow.visible,
                text ?? "",
                style: StyleRefer.poppinsRegular
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Text(
                duration ?? "",
                style: StyleRefer.poppinsRegular.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.checkbox),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ExerciseVideoWidget extends StatelessWidget {
  final String text;

  final String imageRef;

  final String subText;

  const ExerciseVideoWidget({
    Key? key,
    required this.text,
    required this.imageRef,
    required this.subText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 9),
          child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.network(imageRef, fit: BoxFit.fill)),
        ),
        SizedBox(width: Get.width * (0.0266)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: StyleRefer.poppinsRegular
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Text(
              subText,
              style: StyleRefer.poppinsRegular.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.checkbox),
            ),
          ],
        )
      ],
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final String title;
  final bool isChecked;
  final String iconRef;
  final VoidCallback ontap;

  const CategoryWidget({
    Key? key,
    required this.title,
    required this.iconRef,
    required this.ontap,
    required this.isChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(right: 7),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
          decoration: BoxDecoration(
              border: isChecked
                  ? Border.all(color: AppColors.greenColor, width: 2)
                  : null,
              color: AppColors.gradientgreenColor,
              borderRadius: BorderRadius.circular(12)),
          child: Wrap(children: [
            SvgPicture.asset(iconRef, height: 12),
            const SizedBox(width: 3),
            Text(
              title,
              style: StyleRefer.poppinsRegular.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.purple),
            )
          ]),
        ),
      ),
    );
  }
}

class ListSlider extends StatelessWidget {
  const ListSlider(
      {Key? key,
      required this.itemsList,
      this.fontsize,
      this.smalltext,
      required this.barWidth,
      this.onSelectedItemChange,
      required this.initialValue})
      : super(key: key);

  final List<dynamic> itemsList;
  final double? fontsize;
  final bool? smalltext;
  final num barWidth;
  final void Function(int)? onSelectedItemChange;
  final dynamic initialValue;
  @override
  Widget build(BuildContext context) {
    var index = itemsList.indexWhere((e) => e == initialValue);
    index = index < 0 ? 10 : index;
    return Stack(
      children: [
        Positioned(
          top: Get.height * 0.205,
          right: Get.width * barWidth,
          left: Get.width * barWidth,
          child: Container(
            height: 3,
            width: Get.width,
            color: AppColors.greenColor,
          ),
        ),
        smalltext == true
            ? Positioned(
                top: Get.height * 0.25,
                left: Get.width * 0.64,
                child: Text(
                  'cm',
                  style: StyleRefer.openSansRegular
                      .copyWith(fontSize: 17, fontWeight: FontWeight.w400),
                ))
            : const Offstage(),
        Center(
          child: SizedBox(
            height: Get.height * 0.5,
            child: CupertinoPicker(
                magnification: 1,
                looping: false,
                scrollController:
                    FixedExtentScrollController(initialItem: index),
                useMagnifier: true,
                squeeze: 1.3,
                itemExtent: 90,
                diameterRatio: 2.5,
                selectionOverlay: null,
                backgroundColor: Colors.transparent,
                onSelectedItemChanged: onSelectedItemChange,
                children: itemsList
                    .map((e) => Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              e.toString(),
                              style: StyleRefer.openSansSemiBold.copyWith(
                                fontSize: fontsize ?? 56,
                              ),
                            ),
                          ],
                        ))
                    .toList()),
          ),
        ),
        Positioned(
          top: Get.height * 0.295,
          right: Get.width * barWidth,
          left: Get.width * barWidth,
          child: Container(
            height: 3,
            width: Get.width,
            color: AppColors.greenColor,
          ),
        ),
      ],
    );
  }
}

class VideoLoader extends StatefulWidget {
  const VideoLoader({Key? key}) : super(key: key);

  @override
  State<VideoLoader> createState() => _VideoLoaderState();
}

class _VideoLoaderState extends State<VideoLoader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Platform.isAndroid
          ? const CircularProgressIndicator(
              color: Colors.black,
            )
          : const CupertinoActivityIndicator(
              color: Colors.brown,
            ),
    );
  }
}

class JournalFormFeild extends StatelessWidget {
  final TextEditingController? controller;
  final String? hinttext;
  final String? Function(String?)? validator;
  const JournalFormFeild({
    Key? key,
    this.controller,
    required this.hinttext,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      cursorColor: AppColors.greenColor,
      style: StyleRefer.poppinsRegular
          .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hinttext,
        hintStyle: StyleRefer.openSansRegular.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.checkbox,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}

class SleepTiles extends StatelessWidget {
  final String soundsNo, title;
  final void Function()? ontap;

  const SleepTiles({
    Key? key,
    required this.soundsNo,
    required this.title,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: Get.width * (0.416),
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        decoration: BoxDecoration(
            color: AppColors.borderColor,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(soundsNo,
                style: StyleRefer.poppinsMedium.copyWith(
                  overflow: TextOverflow.clip,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                )),
            Expanded(
              child: Text(title,
                  style: StyleRefer.poppinsSemiBold.copyWith(
                    color: AppColors.greenColor,
                    overflow: TextOverflow.clip,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            SizedBox(height: Get.height * (0.0061)),
            Image.asset(AssetRef.sinusoidalpng),
            SizedBox(height: Get.height * (0.0061)),
          ],
        ),
      ),
    );
  }
}

class SingleSketonWidget extends StatelessWidget {
  const SingleSketonWidget({
    Key? key,
    this.height,
    this.width,
    this.widget,
    this.radius,
    this.color,
  }) : super(key: key);
  final double? height, width;
  final Widget? widget;
  final double? radius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 0.0))),
      child: widget,
    );
  }
}

class Skelton extends StatelessWidget {
  const Skelton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.textFieldBorder,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                height: Get.height * (0.08),
                width: Get.width * (0.152),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.04),
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
              ),
              SizedBox(width: Get.width * (0.04)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 20,
                      width: 220,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.04),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 20,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.04),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.04),
                    borderRadius: const BorderRadius.all(Radius.circular(4))),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class WorkoutsExerisesSkelton extends StatelessWidget {
  const WorkoutsExerisesSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SingleSketonWidget(
            height: 60,
            width: 60,
            radius: 12,
            color: AppColors.textFieldBorder),
        SizedBox(width: Get.width * (0.01)),
        Column(
          children: [
            SingleSketonWidget(
                height: Get.height * (0.02),
                width: Get.width * (0.7),
                radius: 4,
                color: AppColors.textFieldBorder),
            SizedBox(height: Get.height * (0.01)),
            SingleSketonWidget(
                height: Get.height * (0.015),
                width: Get.width * (0.7),
                radius: 4,
                color: AppColors.textFieldBorder),
          ],
        )
      ],
    );
  }
}

class ExerisesSkelton extends StatelessWidget {
  const ExerisesSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Get.height * (0.03)),
        SingleSketonWidget(
            height: Get.height * (0.02),
            width: Get.width * (0.8),
            radius: 4,
            color: AppColors.textFieldBorder),
        SizedBox(height: Get.height * (0.03)),
        const RowSkeltonWidget(),
        SizedBox(height: Get.height * (0.015)),
        const RowSkeltonWidget(),
        SizedBox(height: Get.height * (0.015)),
        const RowSkeltonWidget()
      ],
    );
  }
}

class RowSkeltonWidget extends StatelessWidget {
  const RowSkeltonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SingleSketonWidget(
            height: 60,
            width: 60,
            radius: 12,
            color: AppColors.textFieldBorder),
        SizedBox(width: Get.width * (0.01)),
        Column(
          children: [
            SingleSketonWidget(
                height: Get.height * (0.02),
                width: Get.width * (0.6),
                radius: 4,
                color: AppColors.textFieldBorder),
            SizedBox(height: Get.height * (0.01)),
            SingleSketonWidget(
                height: Get.height * (0.015),
                width: Get.width * (0.6),
                radius: 4,
                color: AppColors.textFieldBorder),
          ],
        )
      ],
    );
  }
}

class MeditationSkelton extends StatelessWidget {
  const MeditationSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SingleSketonWidget(
          radius: 20,
          color: AppColors.textFieldBorder,
          widget: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleSketonWidget(
                    height: 20,
                    width: 90,
                    radius: 4,
                    color: Colors.white.withOpacity(0.3)),
                SizedBox(height: Get.height * (0.008)),
                SingleSketonWidget(
                    height: 22,
                    width: 110,
                    radius: 4,
                    color: Colors.white.withOpacity(0.3)),
                SizedBox(height: Get.height * (0.013)),
                SingleSketonWidget(
                    height: 50,
                    width: 110,
                    radius: 16,
                    color: Colors.white.withOpacity(0.3)),
              ],
            ),
          ),
        ),
        SizedBox(width: Get.width * 0.05),
        SingleSketonWidget(
          radius: 20,
          color: AppColors.textFieldBorder,
          widget: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleSketonWidget(
                    height: 20,
                    width: 90,
                    radius: 4,
                    color: Colors.white.withOpacity(0.3)),
                SizedBox(height: Get.height * (0.008)),
                SingleSketonWidget(
                    height: 22,
                    width: 110,
                    radius: 4,
                    color: Colors.white.withOpacity(0.3)),
                SizedBox(height: Get.height * (0.013)),
                SingleSketonWidget(
                    height: 50,
                    width: 110,
                    radius: 16,
                    color: Colors.white.withOpacity(0.3)),
              ],
            ),
          ),
        ),
      ],
    );

    // Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     SizedBox(height: Get.height * (0.03)),
    //     SingleSketonWidget(height: Get.height * (0.02), width: Get.width * (0.8), radius: 4, color: AppColors.textFieldBorder),
    //     SizedBox(height: Get.height * (0.03)),
    //     const RowSkeltonWidget(),
    //     SizedBox(height: Get.height * (0.015)),
    //     const RowSkeltonWidget(),
    //     SizedBox(height: Get.height * (0.015)),
    //     const RowSkeltonWidget()
    //   ],
    // );
  }
}
