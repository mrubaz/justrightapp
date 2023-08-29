// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:just_right/app/notification/view/all_notification.dart';
// 
// import '../controller/newnotification/newnotification_controller.dart';
// import '../controller/newnotification/notification_model.dart';

// class NewNotification extends StatelessWidget {
//   final _controller = Get.put(NewNotificationController());
//   NewNotification({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(height: 30),
//         Obx(
//           () => Expanded(
//             child: ListView.builder(
//               itemCount: _controller.items.length,
//               shrinkWrap: true,
//               itemBuilder: ((context, index) {
//                 NotificationModel notificationDat = _controller.items[index];
//                 return Slidable(
//                   key: Key(index.toString()),
//                   endActionPane: ActionPane(
//                     extentRatio: 0.2,
//                     motion: const StretchMotion(),
//                     children: [
//                       SlidableAction(
//                         backgroundColor: AppColors.redButton,
//                         icon: Icons.delete,
//                         onPressed: (context) {
//                           deleteMsgDialog(context, index);
//                         },
//                       ),
//                     ],
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Column(
//                       children: [
//                         const Divider(
//                             color: AppColors.dotsColors, thickness: 2),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(children: [
//                                 Text(notificationDat.title,
//                                     style: StyleRefer.poppinsMedium
//                                         .copyWith(fontSize: 15)),
//                                 const Spacer(),
//                                 Text(notificationDat.date,
//                                     style: StyleRefer.poppinsMedium
//                                         .copyWith(fontSize: 16)),
//                               ]),
//                               const SizedBox(height: 8),
//                               Text(notificationDat.desc,
//                                   style: StyleRefer.poppinsMedium
//                                       .copyWith(fontSize: 16)),
//                             ],
//                           ),
//                         ),
//                         const Divider(
//                             color: AppColors.dotsColors, thickness: 2),
//                       ],
//                     ),
//                   ),
//                 );
//               }),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
