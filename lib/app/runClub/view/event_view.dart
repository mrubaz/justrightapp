import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets.dart';
import '../controller/event_view_controller.dart';

class EventsScreen extends StatelessWidget {
  EventsScreen({Key? key}) : super(key: key);

  final _controller = Get.put(EventViewController());

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () => _controller.gotoEventDetails(),
                child: EventsCardWidget(
                    date: '20',
                    month: 'June',
                    membersNumber: '20',
                    title: '100 ${AppStrings.squats}',
                    bgImage: AssetRef.squatsEvent,
                    imagesList: _controller.imagesList),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => _controller.gotoEventDetails(),
                child: EventsCardWidget(
                    date: '20',
                    month: 'June',
                    membersNumber: '20',
                    title: '100 ${AppStrings.situps}',
                    bgImage: AssetRef.situpsEvent,
                    imagesList: _controller.imagesList2),
              ),
            ],
          ),
        ));
  }
}
